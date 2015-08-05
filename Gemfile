source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.3'
# Use postgresql as the database for Active Record
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# jquery UI for cool animations
gem 'jquery-ui-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc
# process delayer
gem 'sidekiq'
#to view worker in mount
gem 'sinatra', require: false
gem 'slim'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'
# alternate server, better than default?
gem 'puma'
# library for bulk inserting data using ActiveRecord.
gem 'activerecord-import', '~> 0.7.0'
# for making external API requests
gem 'typhoeus'

gem 'font-awesome-sass'
#for omniauth (oauth and gmail)
gem 'omniauth', '~> 1.2.2'
gem 'omniauth-google-oauth2'

gem 'google-api-client', :require => 'google/api_client'
gem 'twilio-ruby'

gem 'rails_12factor', :group => :production
gem 'whenever', :require => false
# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  # bug fixing
  gem 'pry-rails'
  # replaces the standard Rails error page with a much better and more useful error page. It is also usable outside of Rails in any Rack app as Rack middleware.
  gem 'better_errors'
  # testing platform
  gem 'rspec-rails'
  # Guard::RSpec allows to automatically & intelligently launch specs when files are modified.
  gem 'guard-rspec', require: false
  # feature testing
  gem 'capybara'
  # testing automated emails
  gem 'capybara-email'
  gem 'binding_of_caller'
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
  # simple, fast, threaded, and highly concurrent HTTP 1.1 server for Ruby/Rack applications. 
  gem 'puma-rails'

  # Preview email in the default browser instead of sending it. This means you do not need to set up email delivery in your development environment, and you no longer need to worry about accidentally sending a test email to someone else's address.
  gem "letter_opener"
  # Launchy is helper class for launching cross-platform applications in a fire and forget manner.
  gem "launchy"

  # TablePrint shows objects in nicely formatted columns for easy reading. It even lets you nest other tables of related objects, contextualizing data across tables.
  gem 'table_print'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  gem 'dotenv-rails'
end

