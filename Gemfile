source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.5.1'

group :production do
  gem 'pg'
end

group :development, :test do
  gem 'sqlite3'
end

# maintenance page for site enhancements
gem "turnout"

# Use SCSS for stylesheets
gem 'bootstrap-sass', '~> 3.3.6'
gem 'sass-rails', '>= 3.2'
gem 'bootswatch-rails'
gem 'jquery-ui-rails'

# page load 
gem 'rack-mini-profiler'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Jquery validation
gem 'jquery-validation-rails'

# Use ActiveModel has_secure_password
gem 'bcrypt'

gem "letter_opener", group: :development
gem 'premailer-rails'
gem 'nokogiri'
# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'responders' 

#seed data
gem 'faker'
# gem 'faker-vehicle'

#attachments and amazon s3 (When updating, update with aws-sdk
# Paperclip is now compatible with aws-sdk-s3.

#If you are using S3 storage, aws-sdk-s3 requires you to make a few small
#changes:

#* You must set the `s3_region`
#* If you are explicitly setting permissions anywhere, such as in an initializer,
#   note that the format of the permissions changed from using an underscore to
#   using a hyphen. For example, `:public_read` needs to be changed to
#   `public-read`.

# For a walkthrough of upgrading from 4 to *5* (not 6) and aws-sdk >= 2.0 you can watch
# http://rubythursday.com/episodes/ruby-snack-27-upgrade-paperclip-and-aws-sdk-in-prep-for-rails-5
gem 'paperclip', git: 'git://github.com/thoughtbot/paperclip.git'
# gem 'aws-sdk', '< 2.0'
# gem 'aws-sdk', '~>1.6'
gem 'aws-sdk', '~> 2'

#environment keys
gem 'figaro'

#pagination
gem 'will_paginate', '~> 3.0.6'

# email
gem 'postmark-rails'

# search
gem 'scoped_search'

# read xslx spreadsheets for seed data
gem 'roo'

# business days calculation
gem 'business_time'

gem 'rails_12factor', group: :production

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  
  # run 'bundle' then initialize Guard config with 'guard init bundler'
  gem 'guard-bundler', require: false
  
  # run 'guard init rspec'
  gem 'guard-rspec', require: false
end

ruby "2.3.0"
