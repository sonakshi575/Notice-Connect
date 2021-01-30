from django.db import models

# Create your Notice Model here.
class Notice(models.Model):
    """ Create Notice model

        notice id - primary key
        first_name - required
        last_name -required
        alt_first_name - optional
        alt_last_name - optional
        province - required
        date_of_birth - date format (yyy-mm-dd)
    """
    notice_id = models.AutoField(primary_key=True,auto_created=True, verbose_name='notice id')
    first_name = models.CharField(max_length=255,null=False, verbose_name='first name')
    last_name = models.CharField(max_length=255,null=False, verbose_name='last name')
    alt_first_name = models.CharField(max_length=255,null=True, blank=True,verbose_name='Alt first name')
    alt_last_name = models.CharField(max_length=255,null=True, blank=True, verbose_name='Alt last name')
    province = models.CharField(max_length=50,null=False, verbose_name='province')
    date_of_birth= models.DateField(null=True,verbose_name='date of birth')


    class Meta:
        db_table = 'tblnotice'
        verbose_name = 'Notice'
        verbose_name_plural = 'Notices'


    # def __str__(self):
    #     return f"{self.first_name} {self.last_name}"

