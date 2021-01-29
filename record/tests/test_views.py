from django.test import TestCase, Client
from django.urls import reverse
from notice.models import Notice
from record.models import Record
from rest_framework import status
from record.views import List_Records, Delete_Record, Match_Algorithm
import json
import datetime

class TestViews(TestCase):
    def setUp(self):
        self.client= Client()
        self.list_record_url = reverse('record:list_records')
        self.delete_record_url = reverse('record:delete_record', args=['1'])
        self.record=Record.objects.create(
            first_name="Jonathan",
            last_name="Smith",
            province="Ontario",
            date_of_birth=datetime.date(1990, 1, 1)
        )

    def test_record_list_get(self):
        response= self.client.get(self.list_record_url)
        self.assertEquals(response.status_code, 200)
        self.assertTemplateUsed(response, 'record/list_record.html')

    # def test_delete_record(self):
    #     self.record=Record.objects.create(
    #         first_name="Jonathan",
    #         last_name="Smith",
    #         province="Ontario",
    #         date_of_birth=datetime.date(1990, 1, 1)
    #     )
    #     self.delete_record_url = reverse('record:delete_record', args=[1])
    #     response= self.client.post(self.delete_record_url)
    #     self.assertEquals(response.status_code, 200)
    #     self.assertTemplateUsed(response, 'record/list_record.html')



class TestMatchAlgorithm(TestCase):
    """ Test module for inserting a new record through rest api """

    def setUp(self):
        self.client= Client()
        self.create_record_url = reverse('create_record')
        self.notice= Notice.objects.create(
            first_name="John",
            last_name="Smith",
            alt_first_name="Jo",
            alt_last_name="S",
            province="Ontario",
            date_of_birth=datetime.date(1989, 1, 1)
        )
        self.strong_match = {
            'first_name': 'John',
            'last_name': 'Smith',
            'province': 'Ontario',
            'date_of_birth': '1989-01-01'
        }
        self.possible_match = {
            'first_name': 'John',
            'last_name': 'Smith',
            'province': 'Ontario',
            'date_of_birth': '1999-01-01'
        }
        self.weak_match = {
            'first_name': 'John',
            'last_name': 'Smith',
            'province': 'Quebec',
            'date_of_birth': '1948-01-01'
        }
        self.no_match = {
            'first_name': 'Juanana',
            'last_name': 'Willam',
            'province': 'Saskatchewan',
            'date_of_birth': '1908-01-01'
        }

    def test_create_strong_match_record(self):
        response = self.client.post(self.create_record_url,data=self.strong_match)
        reponse_obj=json.loads(response.content)
        self.assertEquals(response.status_code, status.HTTP_200_OK)
        self.assertEqual(reponse_obj['match_type'], 'Strong Match')

    def test_create_possible_match_record(self):
        response = self.client.post(self.create_record_url,data=self.possible_match)
        reponse_obj=json.loads(response.content)
        self.assertEquals(response.status_code, status.HTTP_200_OK)
        self.assertEqual(reponse_obj['match_type'], 'Possible Match')


    def test_create_weak_match_record(self):
        response = self.client.post(self.create_record_url,data=self.weak_match)
        reponse_obj=json.loads(response.content)
        self.assertEquals(response.status_code, status.HTTP_200_OK)
        self.assertEqual(reponse_obj['match_type'], 'Weak Match')

    def test_no_match_record(self):
        response = self.client.post(self.create_record_url,data=self.no_match)
        reponse_obj=json.loads(response.content)
        # print("No match",reponse_obj)
        self.assertEquals(response.status_code, status.HTTP_200_OK)
        self.assertEqual(reponse_obj,{})
