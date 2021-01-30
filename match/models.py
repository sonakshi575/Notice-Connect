from django.db import models
from notice.models import Notice
from record.models import Record


#CHOICES OF MATCH TYPE
MATCH_TYPES = (
    ("Strong Match", "Strong Match"),
    ("Possible Match", "Possible Match"),
    ("Weak Match", "Weak Match"),
)

#CREATE MATCH MODEL
class Match(models.Model):
    """ Create Match model 
        match id - primary key
        record - foreign key to record model
        notice - foreign key to record model
        match_type - From the choice option
    """
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


