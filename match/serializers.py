from rest_framework import serializers
from match.models import Match

 #To Access Match object in any format when returned as Queryset using Serializer
class MatchSerializer(serializers.ModelSerializer):
    class Meta:
        model = Match
        fields = '__all__'
