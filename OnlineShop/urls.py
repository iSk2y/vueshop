"""OnlineShop URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""

from django.urls import path, include
from django.views.static import serve
from rest_framework import routers
from rest_framework_jwt.views import obtain_jwt_token
from OnlineShop.settings import MEDIA_ROOT
from rest_framework.documentation import include_docs_urls
from goods import views as gview
from users import views as uview
from user_operation import views as uoview
from trade import views as tviews
import xadmin

router = routers.DefaultRouter()
router.register(r'categorys', gview.CategoryViewSet, base_name="categorys")
router.register(r'goods', gview.GoodsListViewSet, base_name='goods')
router.register(r'code', uview.SmsCodeViewset, base_name='code')
router.register(r'users',uview.UserViewSet, base_name='users')
# 配置用户收藏的url
router.register(r'userfavs', uoview.UserFavViewset, base_name="userfavs")
# 用户留言
router.register(r'messages', uoview.LeavingMessageViewset, base_name='messages')
# 配置收货地址
router.register(r'address', uoview.AddressViewset , base_name="address")
# 配置购物车URL
router.register(r'shopcarts', tviews.ShoppingCartViewset, base_name="shopcarts")
# 订单url
router.register(r'orders', tviews.OrderViewset, base_name="orders")

router.register(r'banners', gview.BannerViewset, base_name="banners")
# 首页系列商品展示url
router.register(r'indexgoods', gview.IndexCategoryViewset, base_name="indexgoods")

urlpatterns = [
    path('xadmin/', xadmin.site.urls),
    path('docs/', include_docs_urls(title='慕学生鲜')),
    path('ueditor/', include('DjangoUeditor.urls')),
    path('media/<path:path>', serve, {'document_root':MEDIA_ROOT}),
    # 为了和前端相同 改成login了
    path('login/', obtain_jwt_token),
    path('', include(router.urls)),
]
