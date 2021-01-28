# Generated by Django 3.1.5 on 2021-01-28 11:41

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Notice',
            fields=[
                ('notice_id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='notice id')),
                ('first_name', models.CharField(max_length=255, verbose_name='first name')),
                ('last_name', models.CharField(max_length=255, verbose_name='last name')),
                ('alt_first_name', models.CharField(max_length=255, null=True, verbose_name='Alt first name')),
                ('alt_last_name', models.CharField(max_length=255, null=True, verbose_name='Alt last name')),
                ('province', models.CharField(max_length=50, verbose_name='province')),
                ('date_of_birth', models.DateField(null=True, verbose_name='date of birth')),
            ],
            options={
                'verbose_name': 'Notice',
                'verbose_name_plural': 'Notices',
                'db_table': 'tblnotice',
            },
        ),
    ]