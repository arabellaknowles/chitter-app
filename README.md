# Chitter #

This social media webapp enables the user to sign up, sign in and post peeps that are linked to their account. The site is still under production in terms of styling, however, it is functional. Users can view other users peeps along with the name and the time the peep was posted. The peeps are listed in reverse chronological order to keep the users feed fresh. Signed in users can post a peep with up to 250 characters. 

I used as minimal gems as possible to re-acquaint myself with ruby logic and database interactions. 

### Set up:

- Clone this repository
- In your terminal run:
``` 
~ bundle
```

**Setting up your chitter manager database:**

- In your terminal run:
``` 
~ psql postgres
```
- Create your database:
```
postgres=# CREATE DATABASE chitter_app_manager;
```
- Connect to database:
```
postgres=# \c chitter_app_manager;
```
- Create a peeps table by running the query in file 01_creating_peep_table.sql in the db/migrations directory
- Add a time column to peep table by running the query in file 02_adding_time_column.sql in the db/migrations directory
- Add a name column to peep table by running the query in file 04_adding_name_column.sql in the db/migrations directory
- Add a username column to peep table by running the query in file 05_adding_username_column.sql in the db/migrations directory

**Setting up your test chitter manager database:**

- In your terminal run:
``` 
~ psql postgres
```
- Create your database:
```
postgres=# CREATE DATABASE chitter__app_manager_test;
```
- Connect to database:
```
postgres=# \c chitter__app_manager_test;
```
- Create a peeps table by running the query in file 01_create_peep_table.sql in the db/migrations directory
- Add a time column to peep table by running the query in file 02_add_time_column.sql in the db/migrations directory
- Add a user_id column to peep table by running the query in file 04_add_user_id_column_to_peep_table.sql in the db/migrations directory

**Setting up your chitter account database:**

- In your terminal run:
``` 
~ psql postgres
```
- Create your database:
```
postgres=# CREATE DATABASE chitter_users;
```
- Connect to database:
```
postgres=# \c chitter_users;
```
- Create an accounts table by running the query in file 03_create_users_table.sql in the db/migrations directory

**Setting up your test chitter account database:**

- In your terminal run:
``` 
~ psql postgres
```
- Create your database:
```
postgres=# CREATE DATABASE chitter_users_test;
```
- Connect to database:
```
postgres=# \c chitter_users_test;
```
- Create an accounts table by running the query in file 03_create_users_table.sql in the db/migrations directory

## Features
```
STRAIGHT UP

As a user
So that I can let people know what I am doing  
I want to post a message (peep) to chitter

As a user
So that I can see what others are saying  
I want to see all peeps in reverse chronological order

As a user
So that I can better appreciate the context of a peep
I want to see the time at which it was made

As a user
So that I can post messages on Chitter as me
I want to sign up for Chitter

HARDER

As a user
So that only I can post messages on Chitter as me
I want to log in to Chitter

As a user
So that I can avoid others posting messages on Chitter as me
I want to log out of Chitter

ADVANCED

As a user
So that I can stay constantly tapped in to the shouty box of Chitter
I want to receive an email if I am tagged in a Peep

As a user

In order to start a conversation as a maker I want to reply to a peep from another maker.
```

## Functionality
- You do not have to be logged in to see peeps
- Users sign up to chitter with email, password, name and username
- Username and email are unique
- Peeps have the name and username associated with them
- README should indicate the technologies used, and give instructions on how to install and run the tests.
- Create db with travis
