# rails-hstore-example

This is an example app using Rails 3.2 and PostgreSQL's hstore mechanism to store user preference data
in PostgreSQL as the hstore data type.

A quick run-down:

* bundle exec rake db:migrate
* bundle exec puma
* Navigate to [http://localhost:9292](http://localhost:9292)

See the [Engine Yard Blog](http://blog.engineyard.com/) for the companion article to this codebase.

Check out the [activerecord-postgres-hstore](http://engageis.github.io/activerecord-postgres-hstore/) gem and the [PostgreSQL hstore docs](http://www.postgresql.org/docs/9.2/static/hstore.html) for more information.