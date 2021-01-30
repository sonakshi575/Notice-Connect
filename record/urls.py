from django.conf.urls import url
from django.urls import path, include,re_path
from rest_framework import routers
from record.views import Delete_Record,List_Records

app_name = 'record'

router = routers.DefaultRouter()
urlpatterns = [
    # url(r'^addnewrecord/', Add_Record_Match, name="api_create_record"),
    url(r'^listrecords/', List_Records, name="list_records"),
    re_path(r'^deleterecord/(?P<record_id>.*)$', Delete_Record,name='delete_record')
]
urlpatterns += router.urls