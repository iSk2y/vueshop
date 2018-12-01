from django.shortcuts import render

# Create your views here.
from rest_framework import viewsets
from rest_framework import mixins
from .models import UserFav, UserLeavingMessage, UserAddress
from .serializers import UserFavSerializer, UserFavDetailSerializer, LeavingMessageSerializer, AddressSerializer
from rest_framework_jwt.authentication import JSONWebTokenAuthentication
from rest_framework.authentication import SessionAuthentication
from rest_framework.permissions import IsAuthenticated
from utils.permissions import IsOwnerOrReadOnly


class UserFavViewset(viewsets.GenericViewSet, mixins.ListModelMixin, mixins.CreateModelMixin, mixins.DestroyModelMixin):
    """
    用户收藏视图集
    """
    lookup_field = 'goods_id'
    serializer_class = UserFavSerializer
    pagination_class = None
    # 认证类
    authentication_classes = (JSONWebTokenAuthentication, SessionAuthentication)
    # 权限认证类
    # IsAuthenticated：必须登录用户；IsOwnerOrReadOnly：必须是当前登录的用户
    permission_classes = (IsAuthenticated, IsOwnerOrReadOnly)

    def get_queryset(self):
        # 返回当前用户的列表
        return UserFav.objects.filter(user=self.request.user)

    def get_serializer_class(self):
        # 动态选择序列化类
        if self.action == 'list':
            return UserFavDetailSerializer
        elif self.action == 'create':
            return UserFavSerializer
        return UserFavSerializer

    # 用户收藏的商品数量+1
    # def perform_create(self, serializer):
    #     instance = serializer.save()
    #     # 这里instance相当于UserFav model，通过它找到goods
    #     goods = instance.goods
    #     goods.fav_num += 1
    #     goods.save()


class LeavingMessageViewset(mixins.ListModelMixin, mixins.DestroyModelMixin, mixins.CreateModelMixin,
                            viewsets.GenericViewSet):
    """
    list:
        获取用户留言
    create:
        添加留言
    delete:
        删除留言功能
    """

    permission_classes = (IsAuthenticated, IsOwnerOrReadOnly)
    authentication_classes = (JSONWebTokenAuthentication, SessionAuthentication)
    serializer_class = LeavingMessageSerializer
    pagination_class = None

    # 只能看到自己的留言
    def get_queryset(self):
        return UserLeavingMessage.objects.filter(user=self.request.user)


class AddressViewset(viewsets.ModelViewSet):
    """
    收货地址管理
    list:
        获取收货地址
    create:
        添加收货地址
    update:
        更新收货地址
    delete:
        删除收货地址
    """
    permission_classes = (IsAuthenticated, IsOwnerOrReadOnly)
    authentication_classes = (JSONWebTokenAuthentication, SessionAuthentication)
    serializer_class = AddressSerializer
    pagination_class = None

    def get_queryset(self):
        return UserAddress.objects.filter(user=self.request.user)