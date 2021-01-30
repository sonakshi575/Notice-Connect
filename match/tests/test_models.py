from django.test import TestCase
from notice.models import Notice
from record.models import Record
from match.models import Match
import datetime
import mock

#Class View to  test mdeols
class TestMatchModels(TestCase):

    def setUp(self):
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

    def test_match_record(self):
        """Test the to test record representation"""
        self.assertEqual(self.match.record.record_id,self.record.record_id)

    def test_match_record(self):
        """Test the to test notice representation"""
        self.assertEqual(self.match.notice.notice_id,self.notice.notice_id)

    def test_match_type(self):
        """Test the to test match type representation"""
        self.assertEqual(self.match.match_type,"Strong Match")