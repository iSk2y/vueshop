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
from OnlineShop.settings import MEDIA_ROOT
from rest_framework.documentation import include_docs_urls
from goods import views
import xadmin

router = routers.DefaultRouter()
router.register(r'categorys', views.CategoryViewSet, base_name="categorys")
router.register(r'goods', views.GoodsListViewSet, base_name='goods')

urlpatterns = [
    path('xadmin/', xadmin.site.urls),
    path('ueditor/', include('DjangoUeditor.urls')),
    path('media/<path:path>', serve, {'document_root':MEDIA_ROOT}),

    path('', include(router.urls)),
]
