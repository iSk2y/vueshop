from django.contrib.auth.backends import ModelBackend
from rest_framework.mixins import CreateModelMixin
from rest_framework import viewsets
from rest_framework import status
from rest_framework.response import Response
from rest_framework_jwt.serializers import jwt_encode_handler, jwt_payload_handler
from .serializers import SmsSerializer, UserRegSerializer
from utils.yunpian import YunPian
from OnlineShop.settings import APIKEY
from random import choice
from .models import VerifyCode
from django.contrib.auth import get_user_model
from django.db.models import Q

User = get_user_model()


class CustomBackend(ModelBackend):
    """
    自定义用户验证
    """
    def authenticate(self, request, username=None, password=None, **kwargs):
        try:
            # 用户名和手机都能登录
            user = User.objects.get(
                Q(username=username) | Q(mobile=username))
            if user.check_password(password):
                return user
        except Exception as e:
            return None


class SmsCodeViewset(CreateModelMixin,viewsets.GenericViewSet):
    """
    手机验证码
    """
    serializer_class = SmsSerializer

    def generate_code(self):
        """
        生成四位数字的验证码
        """
        seeds = "1234567890"
        random_str = []
        for i in range(4):
            random_str.append(choice(seeds))

        return "".join(random_str)

    def create(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        # 验证合法
        serializer.is_valid(raise_exception=True)

        mobile = serializer.validated_data["mobile"]

        yun_pian = YunPian(APIKEY)
        # 生成验证码
        code = self.generate_code()

        sms_status = yun_pian.send_sms(code=code, mobile=mobile)

        if sms_status["code"] != 0:
            # 发送失败了
            return Response({
                "mobile": sms_status["msg"]
            }, status=status.HTTP_400_BAD_REQUEST)
        else:
            code_record = VerifyCode(code=code, mobile=mobile)
            code_record.save()
            return Response({
                "mobile": mobile
            }, status=status.HTTP_201_CREATED)


class UserViewSet(CreateModelMixin, viewsets.GenericViewSet):
    """
    用户注册视图
    """
    serializer_class = UserRegSerializer
    queryset = User.objects.all()

    def create(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)

        # 把序列化后的数据赋值给user
        user = self.perform_create(serializer)
        re_dict = serializer.data
        # 实例化payload
        payload = jwt_payload_handler(user)
        re_dict['token'] = jwt_encode_handler(payload)
        re_dict['name'] = user.name if user.name else user.username

        headers = self.get_success_headers(serializer.data)
        return Response(re_dict, status=status.HTTP_201_CREATED, headers=headers)

    def perform_create(self, serializer):
        return serializer.save()
