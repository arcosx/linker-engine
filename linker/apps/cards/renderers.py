from linker.apps.inf.renderers import ConduitJSONRenderer


class CardJSONRenderer(ConduitJSONRenderer):
    object_label = 'card'
    pagination_object_label = 'cards'
    pagination_count_label = 'cardsCount'


class CommentJSONRenderer(ConduitJSONRenderer):
    object_label = 'comment'
    pagination_object_label = 'comments'
    pagination_count_label = 'commentsCount'
