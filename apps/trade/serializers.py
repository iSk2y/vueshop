#!/usr/bin/env python
# -*- coding:utf-8 -*-
#    @Author:iSk2y

from .models import ShoppingCart
from rest_framework import serializers
from .models import OrderInfo, OrderGoods
from goods.models import Goods
from goods.serializers import GoodSerializer


class ShopCartDetailSerializer(serializers.ModelSerializer):
    """
    购物车商品详情信息
    """
    goods = GoodSerializer(many=False, read_only=True)

    class Meta:
        model = ShoppingCart
        fields = ("goods", "nums")


class ShopCartSerializer(serializers.Serializer):

    # 获取当前登录的用户
    user = serializers.HiddenField(
        default=serializers.CurrentUserDefault()
    )
    nums = serializers.IntegerField(required=True, label="数量", min_value=1,
                                    error_messages={
                                        "min_value": "商品数量不能小于一",
                                        "required": "请选择购买数量"
                                    })

    # goods是一个外键，可以通过这方法获取goods object中所有的值
    goods = serializers.PrimaryKeyRelatedField(required=True, queryset=Goods.objects.all())

    def create(self, validated_data):
        # validated_data是已经处理过的数据
        # 获取当前用户
        # view中:self.request.user；serizlizer中:self.context["request"].user
        user = self.context["request"].user
        nums = validated_data["nums"]
        goods = validated_data["goods"]

        existed = ShoppingCart.objects.filter(user=user, goods=goods)

        if existed:
            existed = existed[0]
            existed.nums += nums
            existed.save()
        else:
            # 添加到购物车
            existed = ShoppingCart.objects.create(**validated_data)

        return existed

    def update(self, instance, validated_data):
        # 修改商品数量
        instance.nums = validated_data["nums"]
        instance.save()
        return instance


class OrderGoodsSerializer(serializers.ModelSerializer):
    """
    订单中的商品序列化类
    """
    goods = GoodSerializer(many=False)

    class Meta:
        model = OrderGoods
        fields = "__all__"


class OrderDetailSerializer(serializers.ModelSerializer):
    """
    订单详细信息
    """
    goods = OrderGoodsSerializer(many=True)

    class Meta:
        model = OrderInfo
        fields = "__all__"


class OrderSerializer(serializers.ModelSerializer):
    """
    订单序列化
    """
    user = serializers.HiddenField(
        default=serializers.CurrentUserDefault()
    )
    # 生成订单时这些不用post
    pay_status = serializers.CharField(read_only=True)
    trade_no = serializers.CharField(read_only=True)
    order_sn = serializers.CharField(read_only=True)
    pay_time = serializers.DateTimeField(read_only=True)
    nonce_str = serializers.CharField(read_only=True)
    pay_type = serializers.CharField(read_only=True)

    def generate_order_sn(self):
        # 生成订单号
        # 当前时间+userid+随机数
        from random import Random
        import time
        random_ins = Random()
        order_sn = "{time_str}{userid}{ranstr}".format(time_str=time.strftime("%Y%m%d%H%M%S"),
                                                       userid=self.context["request"].user.id,
                                                       ranstr=random_ins.randint(10, 99))
        return order_sn

    def validate(self, attrs):
        # validate中添加order_sn，然后在view中就可以save
        attrs["order_sn"] = self.generate_order_sn()
        return attrs

    class Meta:
        model = OrderInfo
        fields = "__all__"
