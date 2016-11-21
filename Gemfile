source 'https://rubygems.org'

# The heart of it all
gem 'rails', '~> 5.0.0', '>= 5.0.0.1'
# Development database
gem 'sqlite3'
# Serves as the app server
gem 'puma', '~> 3.0'
# Allows for .scss files
gem 'sass-rails', '~> 5.0'
# Compresses javascript assets
gem 'uglifier', '>= 1.3.0'
# For .coffee files
gem 'coffee-rails', '~> 4.2'

# Handy javascript library
gem 'jquery-rails'
# Makes navigating your web application faster
gem 'turbolinks', '~> 5'
# Makes building JSON APIs easy
gem 'jbuilder', '~> 2.5'

group :development, :test do
  # Debugger console
  gem 'byebug', platform: :mri
end

group :development do
  # Access an IRB console anywhere with <%= console %>
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  # Spring keeps your app running in the background
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# ADDED
# BACKEND
# For login and authentication
gem 'devise'
# For geocoding stuff
gem 'geocoder'
# For phone validation and normalization
gem 'phony_rails'
# For handling file uploads
gem 'carrierwave'
# For handling roles and capabilities
gem 'cancancan'

# FRONTEND
# For marking up pages
gem 'haml-rails'
# For easy page styling
gem 'bootstrap-sass'
# For great icons
gem 'font-awesome-rails'
# For charts
gem 'chartkick'

# EXTERNAL
# For billing
gem 'stripe'
# For texting
gem 'plivo'

# MISC
# For coming up with random stuff
gem 'faker'
# For queues and workers
gem 'resque'
# For scheduling work
gem 'resque-scheduler'

# DEPLOYMENT
group :development do
  # Capistrano, Bundler tasks, and Rails tasks
  gem 'capistrano-rails'
  # For using RVM for task execution
  gem 'capistrano-rvm'
  # For managing server
  gem 'capistrano3-puma'
end
# For managing env variables
gem 'dotenv-rails'

# CODE QUALITY
gem 'rubocop', require: false, group: :development

# BETTER REPL
gem 'pry-rails', group: :development

# TESTING
group :test do
  # Do feature testing through a browser
  # (minitest, minitest-rails, minitest-capybara, and capybara)
  gem 'minitest-rails-capybara'
  # Allows capybara to talk to PhantomJS
  gem 'poltergeist'
  # Pretty test output
  gem 'minitest-reporters'
  # Easy stubbing to a block
  gem 'minitest-stub-const'
end
