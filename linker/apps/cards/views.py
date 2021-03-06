from rest_framework import generics, mixins, status, viewsets
from rest_framework.exceptions import NotFound
from rest_framework.permissions import (
    AllowAny, IsAuthenticated, IsAuthenticatedOrReadOnly
)
from rest_framework.response import Response
from rest_framework.views import APIView

from .models import Card, Comment, Tag
from .renderers import CardJSONRenderer, CommentJSONRenderer
from .serializers import CardSerializer, CommentSerializer, TagSerializer


class CardViewSet(mixins.CreateModelMixin,
                     mixins.ListModelMixin,
                     mixins.RetrieveModelMixin,
                     viewsets.GenericViewSet):

    lookup_field = 'uuid'
    queryset = Card.objects.select_related('author', 'author__user')
    permission_classes = (IsAuthenticatedOrReadOnly,)
    renderer_classes = (CardJSONRenderer,)
    serializer_class = CardSerializer

    def get_queryset(self):
        queryset = self.queryset

        author = self.request.query_params.get('author', None)
        if author is not None:
            queryset = queryset.filter(author__user__username=author)

        tag = self.request.query_params.get('tag', None)
        if tag is not None:
            queryset = queryset.filter(tags__tag=tag)

        favorited_by = self.request.query_params.get('favorited', None)
        if favorited_by is not None:
            queryset = queryset.filter(
                favorited_by__user__username=favorited_by
            )

        return queryset

    def create(self, request):
        serializer_context = {
            'author': request.user.profile,
            'request': request
        }
        print(request.data)
        serializer_data = request.data.get('card', {})

        serializer = self.serializer_class(
        data=serializer_data, context=serializer_context
        )
        serializer.is_valid(raise_exception=True)
        serializer.save()

        return Response(serializer.data, status=status.HTTP_201_CREATED)

    def list(self, request):
        serializer_context = {'request': request}
        page = self.paginate_queryset(self.get_queryset())

        serializer = self.serializer_class(
            page,
            context=serializer_context,
            many=True
        )

        return self.get_paginated_response(serializer.data)

    def retrieve(self, request, uuid):
        serializer_context = {'request': request}

        try:
            serializer_instance = self.queryset.get(uuid=uuid)
        except Card.DoesNotExist:
            raise NotFound('An card with this uuid does not exist.')

        serializer = self.serializer_class(
            serializer_instance,
            context=serializer_context
        )

        return Response(serializer.data, status=status.HTTP_200_OK)


    def update(self, request, uuid):
        serializer_context = {'request': request}

        try:
            serializer_instance = self.queryset.get(uuid=uuid)
        except Card.DoesNotExist:
            raise NotFound('An card with this uuid does not exist.')
            
        serializer_data = request.data.get('card', {})

        serializer = self.serializer_class(
            serializer_instance, 
            context=serializer_context,
            data=serializer_data, 
            partial=True
        )
        serializer.is_valid(raise_exception=True)
        serializer.save()

        return Response(serializer.data, status=status.HTTP_200_OK)


class CommentsListCreateAPIView(generics.ListCreateAPIView):
    lookup_field = 'card__uuid'
    lookup_url_kwarg = 'card_uuid'
    permission_classes = (IsAuthenticatedOrReadOnly,)
    queryset = Comment.objects.select_related(
        'card', 'card__author', 'card__author__user',
        'author', 'author__user'
    )
    renderer_classes = (CommentJSONRenderer,)
    serializer_class = CommentSerializer

    def filter_queryset(self, queryset):
        filters = {self.lookup_field: self.kwargs[self.lookup_url_kwarg]}

        return queryset.filter(**filters)

    def create(self, request, card_uuid=None):
        data = request.data.get('comment', {})
        context = {'author': request.user.profile}

        try:
            context['card'] = Card.objects.get(uuid=card_uuid)
        except Card.DoesNotExist:
            raise NotFound('An card with this uuid does not exist.')

        serializer = self.serializer_class(data=data, context=context)
        serializer.is_valid(raise_exception=True)
        serializer.save()

        return Response(serializer.data, status=status.HTTP_201_CREATED)


class CommentsDestroyAPIView(generics.DestroyAPIView):
    lookup_url_kwarg = 'comment_pk'
    permission_classes = (IsAuthenticatedOrReadOnly,)
    queryset = Comment.objects.all()

    def destroy(self, request, card_uuid=None, comment_pk=None):
        try:
            comment = Comment.objects.get(pk=comment_pk)
        except Comment.DoesNotExist:
            raise NotFound('A comment with this ID does not exist.')

        comment.delete()

        return Response(None, status=status.HTTP_204_NO_CONTENT)


class CardsFavoriteAPIView(APIView):
    permission_classes = (IsAuthenticated,)
    renderer_classes = (CardJSONRenderer,)
    serializer_class = CardSerializer

    def delete(self, request, card_uuid=None):
        profile = self.request.user.profile
        serializer_context = {'request': request}

        try:
            card = Card.objects.get(uuid=card_uuid)
        except Card.DoesNotExist:
            raise NotFound('An card with this uuid was not found.')

        profile.unfavorite(card)

        serializer = self.serializer_class(card, context=serializer_context)

        return Response(serializer.data, status=status.HTTP_200_OK)

    def post(self, request, card_uuid=None):
        profile = self.request.user.profile
        serializer_context = {'request': request}

        try:
            card = Card.objects.get(uuid=card_uuid)
        except Card.DoesNotExist:
            raise NotFound('An card with this uuid was not found.')

        profile.favorite(card)

        serializer = self.serializer_class(card, context=serializer_context)

        return Response(serializer.data, status=status.HTTP_201_CREATED)


class TagListAPIView(generics.ListAPIView):
    queryset = Tag.objects.all()
    pagination_class = None
    permission_classes = (AllowAny,)
    serializer_class = TagSerializer

    def list(self, request):
        serializer_data = self.get_queryset()
        serializer = self.serializer_class(serializer_data, many=True)

        return Response({
            'tags': serializer.data
        }, status=status.HTTP_200_OK)


class CardsFeedAPIView(generics.ListAPIView):
    permission_classes = (IsAuthenticated,)
    queryset = Card.objects.all()
    renderer_classes = (CardJSONRenderer,)
    serializer_class = CardSerializer

    def get_queryset(self):
        return Card.objects.filter(
            author__in=self.request.user.profile.follows.all()
        )

    def list(self, request):
        queryset = self.get_queryset()
        page = self.paginate_queryset(queryset)

        serializer_context = {'request': request}
        serializer = self.serializer_class(
            page, context=serializer_context, many=True
        )

        return self.get_paginated_response(serializer.data)
