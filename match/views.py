from django.shortcuts import render
from match.forms import MatchModelForm
from match.models import Match
# Create your views here.



def List_Matches(request):
    """Helper Function to list match objects"""
    #Fetching all records from Match table order by match_id asc
    matches =Match.objects.all().order_by('match_id')
    #Passing the result of above statement as obj 
    context={
        'matches':matches,
    }
    #rendering match obj on list_match page
    return render(request,'match/list_match.html',context)



