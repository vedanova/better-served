source 'https://rubygems.org'
ruby '1.9.3'
gem 'rails', '4.0.3'
gem 'sass-rails', '~> 4.0.1'
gem 'haml'
gem 'haml-rails'
gem 'uglifier', '~> 2.4.0'
gem 'coffee-rails', '~> 4.0.1'
gem 'jquery-rails', '~> 3.0.4'
gem 'turbolinks', '~> 2.1.0'
gem 'jbuilder', '~> 1.5.3'
gem 'bcrypt-ruby', '~> 3.1.2'
gem 'pg'
gem 'puma'
gem 'simple_form'
# Paging
gem 'kaminari', '~> 0.15.0'
# Slugs and friendly id's
gem 'friendly_id', '~> 5.0.2'
# font-awesome
gem 'font-awesome-sass', '~> 4.0.2'
# Devise
gem 'devise', '~> 3.2.2'

#foreign keys
gem 'foreigner'
group :doc do
  gem 'sdoc', require: false
end

group :test, :cucumber do
  gem "cucumber-rails", require: false
  gem "rspec-rails", '~> 2.14.1'
  gem "capybara", '~> 2.2.1'
  gem "machinist", ">= 2.0"
  gem 'zeus', "0.13.4.pre2", require: false
  gem 'database_cleaner'
  gem 'launchy'
  gem 'email_spec'
end

# development gems
group :development, :test do
  gem 'jazz_hands'
  gem 'sqlite3', '~> 1.3.8'    # dev & test database
  gem 'figaro', '~> 0.7.0'     # env variables
  gem 'rails_layout', '~> 0.5.11'  # Bootstrap 3 layout generator
end

group :development do
  gem 'guard-livereload', require: false
end

#gem 'bootstrap-sass', '~> 3.0.3.0'
