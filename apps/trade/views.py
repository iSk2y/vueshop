from django.shortcuts import render

# Create your views here.
from rest_framework import viewsets
from rest_framework.permissions import IsAuthenticated
from rest_framework import mixins
from utils.permissions import IsOwnerOrReadOnly
from rest_framework_jwt.authentication import JSONWebTokenAuthentication
from rest_framework.authentication import SessionAuthentication
from .serializers import ShopCartSerializer, ShopCartDetailSerializer, OrderSerializer, OrderDetailSerializer
from .models import ShoppingCart, OrderGoods, OrderInfo


class ShoppingCartViewset(viewsets.ModelViewSet):
    """
    购物车功能
    list:
        获取购物车详情
    create：
        加入购物车
    delete：
        删除购物记录
    """
    permission_classes = (IsAuthenticated, IsOwnerOrReadOnly)
    authentication_classes = (JSONWebTokenAuthentication, SessionAuthentication)
    pagination_class = None
    serializer_class = ShopCartSerializer
    lookup_field = "goods_id"

    def get_queryset(self):
        return ShoppingCart.objects.filter(user=self.request.user)

    def get_serializer_class(self):
        if self.action == 'list':
            return ShopCartDetailSerializer
        else:
            return ShopCartSerializer

    def perform_create(self, serializer):
        shop_cart = serializer.save()
        goods = shop_cart.goods
        goods.goods_num -= shop_cart.nums
        goods.save()

    # 库存数+1
    def perform_destroy(self, instance):
        goods = instance.goods
        goods.goods_num += instance.nums
        goods.save()
        instance.delete()

    # 更新库存,修改可能是增加页可能是减少
    def perform_update(self, serializer):
        # 首先获取修改之前的库存数量
        existed_record = ShoppingCart.objects.get(id=serializer.instance.id)
        existed_nums = existed_record.nums
        # 先保存之前的数据existed_nums
        saved_record = serializer.save()
        # 变化的数量
        nums = saved_record.nums - existed_nums
        goods = saved_record.goods
        goods.goods_num -= nums
        goods.save()


class OrderViewset(mixins.ListModelMixin, mixins.RetrieveModelMixin, mixins.CreateModelMixin, mixins.DestroyModelMixin,
                   viewsets.GenericViewSet):
    """
    订单管理
    list:
        获取个人订单
    delete:
        删除订单
    create：
        新增订单
    """
    permission_classes = (IsAuthenticated, IsOwnerOrReadOnly)
    authentication_classes = (JSONWebTokenAuthentication, SessionAuthentication)
    serializer_class = OrderSerializer
    pagination_class = None

    # 动态配置serializer
    def get_serializer_class(self):
        if self.action == "retrieve":
            return OrderDetailSerializer
        return OrderSerializer

    # 获取订单列表
    def get_queryset(self):
        return OrderInfo.objects.filter(user=self.request.user)

    # 在订单提交保存之前还需要多两步步骤，所以这里自定义perform_create方法
    # 1.将购物车中的商品保存到OrderGoods中
    # 2.清空购物车
    def perform_create(self, serializer):
        order = serializer.save()
        # 获取购物车所有商品
        shop_carts = ShoppingCart.objects.filter(user=self.request.user)
        for shop_cart in shop_carts:
            order_goods = OrderGoods()
            order_goods.goods = shop_cart.goods
            order_goods.goods_num = shop_cart.nums
            order_goods.order = order
            order_goods.save()
            # 清空购物车
            shop_cart.delete()
        return order
