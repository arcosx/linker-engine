from rest_framework import serializers
from rest_framework.fields import UUIDField

from linker.apps.authentication.models import User
from .models import Profile


class ProfileSerializer(serializers.ModelSerializer):
    username = serializers.CharField(source='user.username')
    bio = serializers.CharField(allow_blank=True, required=False)
    image = serializers.SerializerMethodField()
    following = serializers.SerializerMethodField()
    follows = serializers.SlugRelatedField(
        many=True,
        queryset=User.objects.all(),
        slug_field='theusername'
    )
    favorites = serializers.SlugRelatedField(
        many=True,
        read_only=True,
        slug_field='body',
     )

    class Meta:
        model = Profile
        fields = ('username', 'bio', 'image', 'following', 'follows','favorites')
        read_only_fields = ('username',)

    def get_image(self, obj):
        if obj.image:
            return obj.image

        return 'http://linkerwgb.oss-cn-hangzhou.aliyuncs.com/default_profile.jpg'

    def get_following(self, instance):
        request = self.context.get('request', None)

        if request is None:
            return False

        if not request.user.is_authenticated:
            return False

        follower = request.user.profile
        followee = instance

        return follower.is_following(followee)
