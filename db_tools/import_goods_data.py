#!/usr/bin/env python
# -*- coding:utf-8 -*-
#    @Author:iSk2y

# 独立使用django的model
import sys
import os

# 获取当前文件的路径（运行脚本）
pwd = os.path.dirname(os.path.realpath(__file__))
# 获取项目的跟目录
sys.path.append(pwd+"../")
# 要想单独使用django的model，必须指定一个环境变量，在manage.py或wsgi.py中找
# 参照manage.py里面就知道为什么这样设置了
os.environ.setdefault("DJANGO_SETTINGS_MODULE", "OnlineShop.settings")

import django
django.setup()

from goods.models import Goods, GoodsCategory, GoodsImage

from db_tools.data.product_data import row_data

for goods_detail in row_data:
    goods = Goods()
    goods.name = goods_detail["name"]
    # 前端中是“￥232”，数据库中是float类型，所以要替换掉
    goods.market_price = float(int(goods_detail["market_price"].replace("￥", "").replace("元", "")))
    goods.shop_price = float(int(goods_detail["sale_price"].replace("￥", "").replace("元", "")))
    goods.goods_brief = goods_detail["desc"] if goods_detail["desc"] is not None else ""
    goods.goods_desc = goods_detail["goods_desc"] if goods_detail["goods_desc"] is not None else ""
    # 取第一张作为封面图
    goods.goods_front_image = goods_detail["images"][0] if goods_detail["images"] else ""
    #取最后一个
    category_name = goods_detail["categorys"][-1]
    # 取出当前子类对应的GoodsCategory对象，filter没有匹配的会返回空数组，不会抛异常。
    category = GoodsCategory.objects.filter(name=category_name)
    if category:
        goods.category = category[0]
    goods.save()

    for goods_image in goods_detail["images"]:
        goods_image_instance = GoodsImage()
        goods_image_instance.image = goods_image
        goods_image_instance.goods = goods
        goods_image_instance.save()