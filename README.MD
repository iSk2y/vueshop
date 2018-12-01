# VueShop
Vue + Django restframework 前后端分离在线电商平台 

简书记录：[Vue+drf前后端分离之生鲜电商项目(一)](https://www.jianshu.com/p/9d93a4bef572) [（二）](https://www.jianshu.com/p/c16662480923)

[博客](https://isk2y.github.io/)笔记：https://isk2y.github.io/2018/11/28/vue-drf-onlineshop/ 

# 开发环境

- Python 3.6.5
- Django 2.1
- OS：Windows 10
- Django restframework 3.9
- Vue 2.9.6
- MySQL 5.7

其他的依赖请看requirements



# Quick Start

```
$ git clone https://github.com/iSk2y/vueshop.git
$ cd vueshop
$ pip install -r requirement.txt
```

- **数据库部署**：SQL结构和数据均已给出，安装MySQL后创建名为vueshop库，导入SQL即可。
- **super**：默认super的账号为admin，密码为rootroot

```
$ python manage.py runserver
```





# 收获

- Django restframework 各个模块的基础和进阶使用，特别是serializer
- 了解Django中的信号signals机制
- 对于电商平台整体架构和业务逻辑的了解
- 对于前后端分离开发的进一步了解



# 缺少

- 对于发送短信、drf 配合Redis缓存、第三方应用登陆、支付模块并未写入实际代码
- sentry部署

