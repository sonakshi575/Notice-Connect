from django.conf.urls import url
from django.urls import path, include
from rest_framework import routers
from record.views import Add_Record_Match

router = routers.DefaultRouter()
urlpatterns = [
    url(r'^addnewrecord/', Add_Record_Match)
]
urlpatterns += router.urls