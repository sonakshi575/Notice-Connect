from django.test import TestCase, Client
from django.urls import reverse
from match.models import Match
from notice.models import Notice
from record.models import Record
from match.views import List_Matches
import datetime


class TestViews(TestCase):
    def setUp(self):
        # Every test needs access to the Client.
        self.client= Client()
        # Match list url reversed
        self.list_match_url = reverse('match:list_matches')
        # self.delete_match_url = reverse('record:delete_match', args=['1'])

        #Creating Notice Obj 
        self.notice= Notice.objects.create(
            first_name="John",
            last_name="Smith",
            alt_first_name="Jo",
            alt_last_name="S",
            province="Ontario",
            date_of_birth=datetime.date(1989, 1, 1)
        )
        #Creating Record Obj 
        self.record=Record.objects.create(
            first_name="John",
            last_name="Smith",
            province="Ontario",
            date_of_birth=datetime.date(1989, 1, 1)
        )
        #Creating Match Obj 
        self.match= Match.objects.create(
            record=self.record,
            notice= self.notice,
            match_type="Strong Match"
        )

    """The match list page loads properly and returns status code 200""" 
    def test_match_list_get(self):
        response= self.client.get(self.list_match_url)
        self.assertEquals(response.status_code, 200)
        self.assertTemplateUsed(response, 'match/list_match.html')


