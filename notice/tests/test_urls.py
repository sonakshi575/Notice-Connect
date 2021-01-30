from django.test import TestCase, SimpleTestCase
from django.urls import reverse , resolve
from notice.views import List_Notices

class TestUrls(SimpleTestCase):
    def test_notice_list_url(self):
        url= reverse('notice:list_notices')
        self.assertEquals(url, '/listnotices/')

    def test_record_list_url_resolved(self):
        url= reverse('notice:list_notices')
        self.assertEquals(resolve(url).func,List_Notices)


