class User < ActiveRecord::Base
  # Use the activerecord-postgres-hstore serializer
  serialize :preferences, ActiveRecord::Coders::Hstore

  # Require an email address at the bare minimum. Preferences can be blank.
  validates :email, :presence => true, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/ }

  # Define which themes, languages and currencies are valid.
  def self.valid_themes
    [
      "Dark",
      "Light",
      "Future"
    ]
  end

  def self.valid_currencies
    [
      "USD",
      "AUD",
      "GBP",
      "JPY",
      "CDN",
      "EUR",
      "BTC"
    ]
  end

  def self.valid_languages
    [
      "US English",
      "UK English",
      "Hindi",
      "Aramaic",
      "Arabic",
      "Japanese",
      "French",
      "German",
      "Italian",
      "Hebrew",
      "l33tsp34k"
    ]
  end
end
