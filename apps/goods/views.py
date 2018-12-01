from rest_framework.response import Response
from .serializers import CategorySerializer,GoodSerializer
from .filters import GoodsFilter
from django_filters.rest_framework import DjangoFilterBackend
from rest_framework import filters
from rest_framework.pagination import PageNumberPagination
from .models import Goods, GoodsCategory, Banner
from rest_framework import generics
from rest_framework.throttling import UserRateThrottle,AnonRateThrottle
from .serializers import BannerSerializer, IndexCategorySerializer
from rest_framework_extensions.cache.mixins import CacheResponseMixin
from rest_framework import mixins, viewsets


class CategoryViewSet(mixins.ListModelMixin, mixins.RetrieveModelMixin, viewsets.GenericViewSet):
    """
    list:
        商品分类列表数据
    """

    queryset = GoodsCategory.objects.filter(category_type=1)
    serializer_class = CategorySerializer
    pagination_class = None


class GoodsPagination(PageNumberPagination):
    """
    商品列表自定义分页
    """
    # 默认每页显示的个数
    page_size = 12
    # 可以动态改变每页显示的个数
    page_size_query_param = 'page_size'
    # 页码参数
    page_query_param = 'page'
    # 最多能显示多少页
    max_page_size = 100


class GoodsListViewSet(CacheResponseMixin, mixins.ListModelMixin, mixins.RetrieveModelMixin, viewsets.GenericViewSet):
    """
    list:
        商品列表数据
    """
    queryset = Goods.objects.all().order_by("id")
    pagination_class = GoodsPagination
    filter_backends = (DjangoFilterBackend, filters.SearchFilter, filters.OrderingFilter)
    filter_class = GoodsFilter
    # 设置filter的类为我们自定义的类
    serializer_class = GoodSerializer
    throttle_classes = (UserRateThrottle, AnonRateThrottle)
    # 搜索
    search_fields = ('name', 'goods_brief', 'goods_desc')
    # 排序
    ordering_fields = ('sold_num', 'shop_price')

    # 商品点击数 + 1
    def retrieve(self, request, *args, **kwargs):
        instance = self.get_object()
        instance.click_num += 1
        instance.save()
        serializer = self.get_serializer(instance)
        return Response(serializer.data)


class BannerViewset(mixins.ListModelMixin, viewsets.GenericViewSet):
    """
    首页轮播图
    """
    queryset = Banner.objects.all().order_by("index")
    serializer_class = BannerSerializer
    pagination_class = None


class IndexCategoryViewset(mixins.ListModelMixin, viewsets.GenericViewSet):
    """
    首页商品分类数据
    """
    # 获取is_tab=True（导航栏）里面的分类下的商品数据
    queryset = GoodsCategory.objects.filter(is_tab=True, name__in=["生鲜食品", "酒水饮料"])
    serializer_class = IndexCategorySerializer
    pagination_class = None