from django.test import TestCase
from record.models import Record
import datetime
import mock

class TestModels(TestCase):
    
    def setUp(self):
         #Creating record Obj 
        self.record= Record.objects.create(
            first_name="John",
            last_name="Smith",
            province="Ontario",
            date_of_birth=datetime.date(1990, 1, 1)
        )
    
    def test_record_str(self):
        """Test the notice first_name representation"""
        self.assertEqual(str(self.record.first_name),"John")
        
