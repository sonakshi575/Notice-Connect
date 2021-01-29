from django import forms 
from record.models import Record
from django.forms import DateInput

class RecordModelForm(forms.ModelForm):
    
    class Meta:
        model = Record
        fields = ("first_name","last_name","province","date_of_birth",)
        widgets = {
            'date_of_birth': DateInput(attrs={'type': 'date'})
        }
