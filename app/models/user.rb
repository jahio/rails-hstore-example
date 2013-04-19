class User < ActiveRecord::Base
  # Use the activerecord-postgres-hstore serializer
  serialize :preferences, ActiveRecord::Coders::Hstore

  # Require an email address at the bare minimum. Preferences can be blank.
  validates :email, :presence => true, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/ }
end
