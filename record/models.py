from django.db import models

# Create your models here.
class Record(models.Model):
    """ Create record model"""
    record_id = models.AutoField(primary_key=True,auto_created=True, verbose_name='notice id')
    first_name = models.CharField(max_length=255,null=False, verbose_name='first name')
    last_name = models.CharField(max_length=255,null=False, verbose_name='last name')
    province = models.CharField(max_length=50,null=False, verbose_name='province')
    date_of_birth= models.DateField(null=True,verbose_name='date of birth')


    class Meta:
        db_table = 'tblrecord'
        verbose_name = 'Record'
        verbose_name_plural = 'Records'


    # def __str__(self):
    #     return f"{self.first_name} {self.last_name}"