## README

This application calculates the start time, end time and distance covered by a rental car 
based on timestamped coordinates loaded from csv files

#### Dependance

Ruby version : 2.3.1

#### Initialize all gems

```
cd georental
bundle install
```

#### Migrate a seed the database (sqlite)

```
bundle exec rake db:migrate
bundle exec rake db:seed
```

#### To run the test suite

```
cd georental
rspec
```

#### How it works

The application comes loaded with a few rental cars (brands, models, vehicle categories, engine type, and energy types.
To create a new travel for a rental, click on "Edit" in the rental line last column.
 
In the Edit page, you can edit the rental car information and view a table
containing all the travels associated with it if any (none by default)
To create a new one, click on "Add Travel".

In the next page you can load the travel data from a csv file.

Click on "Load", select your csv file, then click on "Process".

When processing is done, you should be redirected to the travels page where your new travel will apoear with the following info:

**Start time (as date and time).

**End time (as date and time).

**Distance covered (in miles).

