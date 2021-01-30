from django.test import TestCase, Client
from django.urls import reverse
from notice.models import Notice
from rest_framework import status
from notice.views import List_Notices
import json
import datetime

class TestViews(TestCase):
    def setUp(self):
        # Every test needs access to the Client.
        self.client= Client()
        # notice list url reversed
        self.list_notice_url = reverse('notice:list_notices')
        # DELETE Notice url reversed
        self.delete_notice_url = reverse('notice:delete_notice', args=['1'])
         #Creating Notice Obj 
        self.notice= Notice.objects.create(
            first_name="John",
            last_name="Smith",
            alt_first_name="Jo",
            alt_last_name="S",
            province="Ontario",
            date_of_birth=datetime.date(1989, 1, 1)
        )

    """The notice list page loads properly and returns status code 200""" 
    def test_notice_list_get(self):
        response= self.client.get(self.list_notice_url)
        self.assertEquals(response.status_code, 200)
        self.assertTemplateUsed(response, 'notice/list_notice.html')

    """On delete notice returns status code 404""" 
    def test_delete_notice(self):
        response= self.client.post(self.delete_notice_url)
        self.assertEquals(response.status_code, 404)
