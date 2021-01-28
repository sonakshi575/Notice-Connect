from django.test import TestCase
from notice.models import Notice
import datetime
import mock

class TestModels(TestCase):
    
    def setUp(self):
        self.notice= Notice.objects.create(
            first_name="John",
            last_name="Smith",
            alt_first_name="Jo",
            alt_last_name="S",
            province="Ontario",
            date_of_birth=datetime.date(1989, 1, 1)
        )

    def test_notice_str(self):
        """Test the notice string representation"""
        self.assertEqual(str(self.notice),"John Smith")
        
