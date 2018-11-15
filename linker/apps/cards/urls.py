from django.conf.urls import include, url

from rest_framework.routers import DefaultRouter

from .views import (
    CardViewSet, CardsFavoriteAPIView, CardsFeedAPIView,
    CommentsListCreateAPIView, CommentsDestroyAPIView, TagListAPIView
)

router = DefaultRouter(trailing_slash=False)
router.register(r'cards', CardViewSet)

urlpatterns = [
    url(r'^', include(router.urls)),
    url(r'^cards/feed/?$', CardsFeedAPIView.as_view()),
    url(r'^cards/(?P<card_slug>[-\w]+)/favorite/?$',
        CardsFavoriteAPIView.as_view()),
    url(r'^cards/(?P<card_slug>[-\w]+)/comments/?$',
        CommentsListCreateAPIView.as_view()),
    url(r'^cards/(?P<card_slug>[-\w]+)/comments/(?P<comment_pk>[\d]+)/?$',
        CommentsDestroyAPIView.as_view()),
    url(r'^tags/?$', TagListAPIView.as_view()),
]
