#!/usr/bin/env python
# -*- coding:utf-8 -*-
#    @Author:iSk2y

#
# 要在apps.py中引入下 我没引入 注释了 感觉在serializer中重载更灵活
#
#
#

from django.db.models.signals import post_save
from django.dispatch import receiver
from django.contrib.auth import get_user_model
User = get_user_model()


# post_save:接收信号的方式，在save后
# sender: 接收信号的model
@receiver(post_save, sender=User)
def create_user(sender, instance=None, created=False, **kwargs):
    # 是否新建，因为update的时候也会进行post_save
    if created:
        password = instance.password
        # instance相当于user
        instance.set_password(password)
        instance.save()