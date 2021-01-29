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

    def test_notice_first_name(self):
        """Test the to test first name representation"""
        self.assertEqual(str(self.notice.first_name),"John")
        
    def test_notice_last_name(self):
        """Test the to test last name representation"""
        self.assertEqual(self.notice.last_name, 'Smith')
    
    def test_notice_alt_first_name(self):
        """Test the to test alt first name representation"""
        self.assertEqual(self.notice.alt_first_name, 'Jo')

    def test_notice_alt_last_name(self):
        """Test the to test alt last name representation"""
        self.assertEqual(self.notice.alt_last_name, 'S')

    def test_notice_province(self):
        """Test the to test province representation"""
        self.assertEqual(self.notice.province, 'Ontario')

    def test_notice_date_of_birth(self):
        """Test the to test date of birth representation"""
        self.assertEqual(str(self.notice.date_of_birth), '1989-01-01')