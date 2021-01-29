from django.test import TestCase, SimpleTestCase
from django.urls import reverse , resolve
from match.views import List_Matches


class TestUrls(SimpleTestCase):
    def test_record_list_url(self):
        url= reverse('match:list_matches')
        self.assertEquals(url, '/listmatches/')

    def test_record_list_url_resolved(self):
        url= reverse('match:list_matches')
        self.assertEquals(resolve(url).func,List_Matches)