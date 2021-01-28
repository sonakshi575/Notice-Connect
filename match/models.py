from django.db import models
from notice.models import Notice
from record.models import Record
# Create your models here.

MATCH_TYPES = (
    ("Strong Match", "Strong Match"),
    ("Possible Match", "Possible Match"),
    ("Weak Match", "Weak Match"),
)


class Match(models.Model):
    """ Create Match model"""
    match_id = models.AutoField(primary_key=True,auto_created=True, 
        verbose_name='match id')
    record = models.ForeignKey( Record,  db_column='record_id', 
        on_delete=models.CASCADE, verbose_name='record')
    notice = models.ForeignKey( Notice, db_column='notice_id', 
        on_delete=models.CASCADE, verbose_name='notice')
    match_type = models.CharField(max_length=25,
                                    choices=MATCH_TYPES
                                    )
    class Meta:
        db_table = 'tblmatch'
        verbose_name = 'Match'
        verbose_name_plural = 'Matches'


    def __str__(self):
        return str(self.match_id)


