# Notice-Connect
Django application to categorize Record as Strong match, Possible match or Weak match based off below Match Algorithm conditions:

1. Strong Match:
 - first_name or alt_first_name of notice matches with first_name of record
 - last_name or alt_last_name of notice matches with last_name of record
 - date_of_birth and province are matching

2. Possible Match
 - first_name, last_name, province are matching

3. Weak Match
 - Only first_name and last_name are matching



# Python Version 3.7.4
