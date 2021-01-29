"""NoticeConnect URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include
from django.conf.urls import include, url
from django.conf.urls.static import static
from django.conf import settings
from django.contrib.staticfiles.urls import staticfiles_urlpatterns
from match.views import List_Matches
from record.views import Create_Record

app_name = 'noticeconnect'

urlpatterns = [
    path('',Create_Record, name='create_record'),
    path('admin/', admin.site.urls),
    path('', include('notice.urls')),
    path('', include('record.urls')),
    path('', include('match.urls')),
    # path('', List_Matches, name="home" )
    # path('api-auth',include('rest_framework.urls')),
]
urlpatterns += staticfiles_urlpatterns()