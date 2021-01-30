from rest_framework import serializers
from record.models import Record


 #To Access Record object in any format when returned as Queryset using Serializer
 
class RecordSerializer(serializers.ModelSerializer):
    class Meta:
        model = Record
        fields = '__all__'