source 'https://rubygems.org'

gem 'rails', '~> 3.2.13'

gem 'pg'
gem 'json'
gem 'strong_parameters'
gem 'activerecord-postgres-hstore' # for hstore

group :development, :test do
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'better_errors'
  gem 'binding_of_caller'
  platforms :mri, :rbx do
    gem "pry"
  end
end

# Application server
gem 'puma'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'