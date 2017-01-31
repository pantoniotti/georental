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
To create a new travel for a rental, click on "Add Travel" in the rental line last column.
 
In the "New Travel" page you can load the travel data from a csv file.

Click on "Load", select your csv file, then click on "Process".

When processing is done, you should be redirected to the travel edit page 
where your new travel will appear with the following info:

* Start time (as date and time).
* End time (as date and time).
* Distance covered (in km).

And in tabs

* A map showing the path (in red) of all the rental movements with start and end markers
* A table of all the recorded positions

