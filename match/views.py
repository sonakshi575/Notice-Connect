from django.shortcuts import render
from match.forms import MatchModelForm
from match.models import Match
# Create your views here.


def List_Matches(request):
    matches =Match.objects.all().order_by('-match_id')
    context={
        'matches':matches,
    }
    return render(request,'match/list_match.html',context)

