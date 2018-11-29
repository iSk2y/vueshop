#!/usr/bin/env python
# -*- coding:utf-8 -*-
#    @Author:iSk2y

from rest_framework import serializers

from .models import GoodsCategory, Goods, GoodsImage


class CategorySerializer3(serializers.ModelSerializer):
    """
    三级分类
    """
    class Meta:
        model = GoodsCategory
        fields = "__all__"


class CategorySerializer2(serializers.ModelSerializer):
    """
    二级分类
    """
    # 在parent_category字段中定义的related_name="sub_cat"
    sub_cat = CategorySerializer3(many=True)

    class Meta:
        model = GoodsCategory
        fields = "__all__"


class CategorySerializer(serializers.ModelSerializer):
    """
    商品一级类别序列化
    """
    sub_cat = CategorySerializer2(many=True)

    class Meta:
        model = GoodsCategory
        fields = "__all__"


class GoodsImageSerializer(serializers.ModelSerializer):
    class Meta:
        model = GoodsImage
        fields = ("image",)


class GoodSerializer(serializers.ModelSerializer):
    """
    商品序列化
    """
    category = CategorySerializer()
    # images是数据库中设置的related_name="images"
    images = GoodsImageSerializer(many=True)

    class Meta:
        model = Goods
        fields = '__all__'
