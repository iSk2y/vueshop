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

from goods.models import GoodsCategory
from db_tools.data.category_data import row_data

# 一级类
for lev1_cat in row_data:
    lev1_intance = GoodsCategory()
    lev1_intance.code = lev1_cat["code"]
    lev1_intance.name = lev1_cat["name"]
    lev1_intance.category_type = 1
    # 保存到数据库
    lev1_intance.save()
# 二级类
    for lev2_cat in lev1_cat["sub_categorys"]:
        lev2_intance = GoodsCategory()
        lev2_intance.code = lev2_cat["code"]
        lev2_intance.name = lev2_cat["name"]
        lev2_intance.category_type = 2
        lev2_intance.parent_category = lev1_intance
        lev2_intance.save()
# 三级类
        for lev3_cat in lev2_cat["sub_categorys"]:
            lev3_intance = GoodsCategory()
            lev3_intance.code = lev3_cat["code"]
            lev3_intance.name = lev3_cat["name"]
            lev3_intance.category_type = 3
            lev3_intance.parent_category = lev2_intance
            lev3_intance.save()