from django import forms 
from match.models import Match


'''Match Forms'''
class MatchModelForm(forms.ModelForm):
   
    class Meta:
        model = Match
        fields = ("record","notice","match_type", )

