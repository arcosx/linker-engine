from django.db import models
import uuid
from linker.apps.inf.models import TimestampedModel


class Card(TimestampedModel):
    uuid = models.UUIDField(primary_key=True, default=uuid.uuid4, unique=True, editable=False)
    description = models.TextField(blank=True)
    body = models.URLField()

    author = models.ForeignKey(
        'profiles.Profile', on_delete=models.CASCADE, related_name='cards'
    )

    tags = models.ManyToManyField(
        'cards.Tag', related_name='cards'
    )

    @property
    def get_uuid(self):
        return self.uuid

    def __str__(self):
        return self.uuid


class Comment(TimestampedModel):
    body = models.TextField()

    card = models.ForeignKey(
        'cards.Card', related_name='comments', on_delete=models.CASCADE
    )

    author = models.ForeignKey(
        'profiles.Profile', related_name='comments', on_delete=models.CASCADE
    )
    def __str__(self):
        return self.body

class Tag(TimestampedModel):
    tag = models.CharField(max_length=255)
    slug = models.SlugField(db_index=True, unique=True)

    def __str__(self):
        return self.tag
