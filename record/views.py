from django.shortcuts import render
from django.http import JsonResponse, HttpResponse
from notice.models import Notice
from notice.serializers import NoticeSerializer
from match.models import Match
from match.serializers import MatchSerializer
from record.models import Record
from rest_framework.response import Response
from rest_framework.decorators import api_view, permission_classes
from django.core import serializers
import json
import string
from django.utils.dateparse import parse_date
from django.conf import settings
from record.forms import RecordModelForm
# Create your views here.
@api_view(['POST'])
def Add_Record_Match(request):
    # get the user
    user = None
    print('Request',request.data)
    try:
        user = request.user
    except:
        return Response("INVALID_USER")
    
    returnValue = {}


    data = None
    first_name=None
    last_name=None
    province=None
    date_of_birth=None

    try:
        data = request.data
        first_name=data['first_name']
        last_name=data['last_name']
        province=data['province']
        date_of_birth=parse_date(data['date_of_birth'])
    except:
        return Response("IMPROPER REQUEST")
    
    # add_row_record = None
    recordobj=None
    try:
        recordobj = Record(first_name=first_name,last_name=last_name,province=province, date_of_birth=date_of_birth)
        recordobj.save()
        # returnValue['record_id'] = add_row_record.record_id
        # print(recordobj.record_id)        
    except:
        return Response("COULD NOT ADD ROW IN RECORD TABLE")
    
    match_list = {}
    # returnValue = {}
    # recordobj= Record.objects.filter(record_id=int(13))[0]
    # print(recordobj)
    noticeobj = Notice.objects.all()
    for notice in noticeobj:
        if (notice.first_name==recordobj.first_name or notice.alt_first_name==recordobj.first_name) and (notice.last_name==recordobj.last_name or notice.alt_last_name==recordobj.last_name) and notice.province==recordobj.province and notice.date_of_birth==recordobj.date_of_birth:
            match_list['record_id']=recordobj.record_id
            match_list['notice_id']=notice.notice_id
            match_list['match_type']="Strong Match"           
        elif(notice.first_name==recordobj.first_name and notice.last_name==recordobj.last_name and notice.province==recordobj.province):
            match_list['record_id']=recordobj.record_id
            match_list['notice_id']=notice.notice_id
            match_list['match_type']="Possible Match"
        elif (notice.first_name==recordobj.first_name and notice.last_name==recordobj.last_name):
            match_list['record_id']=recordobj.record_id
            match_list['notice_id']=notice.notice_id
            match_list['match_type']="Weak Match"
        else:
            pass

    try:
        if match_list:
            add_row_match = Match(record_id=match_list['record_id'],notice_id=match_list['notice_id'],
                match_type=match_list['match_type'])
            add_row_match.save()
            returnValue['match_id'] = add_row_match.match_id
            returnValue['notice_id'] = add_row_match.notice_id
            returnValue['record_id'] = add_row_match.record_id
            returnValue['match_type'] = add_row_match.match_type
        else:
            pass
    except:
        return Response("COULD NOT ADD ROW IN MATCH TABLE")
    
    return Response(returnValue)







