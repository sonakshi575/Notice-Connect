from django.conf.urls import url
from django.urls import path, include, re_path, reverse_lazy
from rest_framework import routers
from django.conf.urls import url
from match.views import List_Matches

app_name = 'match'
router = routers.DefaultRouter()
urlpatterns = [
    url(r'^listmatches/', List_Matches, name="list_matches"),
]
urlpatterns += router.urls

