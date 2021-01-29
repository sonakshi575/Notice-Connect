from django import forms 
from record.models import Record


class RecordModelForm(forms.ModelForm):
    
    class Meta:
        model = Record
        fields = ("first_name","last_name","province","date_of_birth",)
