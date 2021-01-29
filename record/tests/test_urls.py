from django.test import TestCase, SimpleTestCase
from django.urls import reverse , resolve
from record.views import List_Records

class TestUrls(SimpleTestCase):
    def test_record_list_url(self):
        url= reverse('record:list_records')
        self.assertEquals(url, '/listrecords/')

    def test_record_list_url_resolved(self):
        url= reverse('record:list_records')
        self.assertEquals(resolve(url).func,List_Records)