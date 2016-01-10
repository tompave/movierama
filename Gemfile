source 'https://rubygems.org'

ruby '2.2.2'

# App runner
gem 'foreman'
# .env files loading
gem 'dotenv-rails', groups: [:development, :test]

# Use unicorn as the app server
gem 'unicorn'

# Productio nmonitoring
gem 'newrelic_rpm'
# Fixes Rails architecture kludges
gem 'rails_12factor', group: :production

# Forces SSL usage
gem 'rack-ssl'

# Use Redis as backing store
gem 'ohm'
gem 'ohm-contrib'

# ♥︎ thin models
gem 'draper'

# Use Redis as cache
gem 'redis-rails'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.6'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# Use Haml for views
gem 'haml-rails'

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# UX building blocks
gem 'bootstrap-sass'


gem 'omniauth' # Authentication
gem 'omniauth-github'
gem 'cancan'   # Authorisation


group :development do
  gem 'letter_opener', '~> 1.4'
  gem 'pry'
  gem 'pry-nav'
  gem 'pry-doc'
end

group :test do
  gem 'guard-rspec'    # Continuous testing
  gem 'rspec-rails'    # Test framework with Rail extensions
  gem 'poltergeist'    # Driver for PhantomJS headless browser
  gem 'capybara'       # DSL for browser control
end
