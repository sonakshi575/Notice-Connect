from rest_framework import serializers
from notice.models import Notice

 #To Access Notice object in any format when returned as Queryset using Serializer
class NoticeSerializer(serializers.ModelSerializer):
    class Meta:
        model = Notice
        fields = '__all__'