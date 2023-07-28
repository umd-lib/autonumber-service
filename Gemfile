source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.1.7', '>= 6.1.7.4'
# Use sqlite3 as the database for Active Record
gem 'sqlite3', '~> 1.4'
# Use Puma as the app server
gem 'puma', '~> 5.0'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 5.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false

gem 'will_paginate', '~> 4.0'

gem 'will_paginate-bootstrap'

gem 'umd_lib_style', github: 'umd-lib/umd_lib_style', ref: '2.0.0'

gem 'ransack'

gem 'date', '~> 3.3.3'

# CAS Authentication
# April 25, 2016: Need to use GitHub instead of Gem
# See https://github.com/rubycas/rubycas-client-rails/issues/27
gem 'rubycas-client', github: 'rubycas/rubycas-client', branch: 'master'

# dotenv - For storing production configuration parameters
gem 'dotenv-rails', '~> 2.8', '>= 2.8.1'

# Use jquery as the JavaScript library
gem 'jquery-rails'

gem 'jquery-ui-rails'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 4.1.0'
  # Display performance information such as SQL time and flame graphs for each request in your browser.
  # Can be configured to work on production as well see: https://github.com/MiniProfiler/rack-mini-profiler/blob/master/README.md
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'listen', '~> 3.3'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 3.26'
  # gem 'selenium-webdriver', '>= 4.0.0.rc1'
  # Easy installation and use of web drivers to run system tests with browsers
  # gem 'webdrivers'
  gem 'rubocop', '= 1.55.0', require: false
  gem 'rubocop-rails', '= 2.20.2', require: false
  gem 'rubocop-checkstyle_formatter', '~> 0.6.0', require: false
  gem 'simplecov', require: false
  gem 'simplecov-rcov', require: false
  gem 'minitest-reporters'
  gem 'faker', '~> 3.2'
  gem 'rails-controller-testing'
end

group :production do
  gem 'pg', '~> 0.18.4'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
