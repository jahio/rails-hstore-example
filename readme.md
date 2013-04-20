# rails-hstore-example

This is an example app using Rails 3.2 and PostgreSQL's hstore mechanism to store user preference data
in PostgreSQL as the hstore data type.

A quick run-down:

* Ruby *1.9* or better required
* checkout the repo, set up a local PostgreSQL database and user, then cp config/database.yml.example config/database.yml
* edit config/database.yml to your liking for dev/test environments
* bundle install
* bundle exec rake db:migrate (or bundle exec rake db:create, then migrate if you haven't created the db yet)
* bundle exec puma
* Navigate to [http://localhost:9292](http://localhost:9292)

To run tests:
bundle exec rake spec

See the [Engine Yard Blog](http://blog.engineyard.com/) for the companion article to this codebase.

Check out the [activerecord-postgres-hstore](http://engageis.github.io/activerecord-postgres-hstore/) gem and the [PostgreSQL hstore docs](http://www.postgresql.org/docs/9.2/static/hstore.html) for more information.
