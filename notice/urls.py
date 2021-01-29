from django.conf.urls import url
from django.urls import path, include,re_path
from rest_framework import routers
from notice.views import Delete_Notice,List_Notices

app_name = 'notice'
router = routers.DefaultRouter()
urlpatterns = [
     url(r'^listnotices/', List_Notices, name="list_notices"),
    re_path(r'^deletenotice/(?P<notice_id>.*)$', Delete_Notice,name='delete_notice')
]
urlpatterns += router.urls