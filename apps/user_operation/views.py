from django.shortcuts import render

# Create your views here.
from rest_framework import viewsets
from rest_framework import mixins
from .models import UserFav
from .serializers import UserFavSerializer
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