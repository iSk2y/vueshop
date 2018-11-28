#!/usr/bin/env python
# -*- coding:utf-8 -*-
#    @Author:iSk2y

import requests
import json


class YunPian(object):

    def __init__(self, api_key):
        self.api_key = api_key
        self.single_send_url = "https://sms.yunpian.com/v2/sms/single_send.json"

    def send_sms(self, code, mobile):
        """
        实际发送短信方法
        :param code: 随机code验证码
        :param mobile: 手机号码
        :return: 云片网接口返回内容 dict
        """

        # 需要传递的参数
        params = {
            "apikey": self.api_key,
            "mobile": mobile,
            "text": "【慕雪生鲜超市】您的验证码是{code}。如非本人操作，请忽略本短信".format(code=code)
        }

        response = requests.post(self.single_send_url, data=params)
        re_dict = json.loads(response.text)
        return re_dict