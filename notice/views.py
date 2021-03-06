from django.shortcuts import render
from notice.models import Notice
from django.shortcuts import get_list_or_404, get_object_or_404
from django.urls import reverse 
# Create your views here.



# Notice List view 
def List_Notices(request):
    # fetch the object related to notice id 
    notices =Notice.objects.all().order_by('notice_id')
    #Dictionary with the notices obj to be rendered on list_notice.html
    context={
        'notices':notices,
    }
    return render(request,'notice/list_notice.html',context)


# delete view for Notice 
def Delete_Notice(request, notice_id): 
    # dictionary for initial data with  
    # field names as keys 
    context ={} 
  
    # fetch the object related to notice id 
    obj = get_object_or_404(Notice, notice_id = notice_id) 
  
    # delete object 
    obj.delete() 
    # after deleting redirect to  
    # notice list page 
    notices =Notice.objects.all().order_by('notice_id')
    context={
        'notices':notices,
    }
        
    return render(request,'notice/list_notice.html',context) 