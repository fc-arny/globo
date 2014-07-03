source 'https://rubygems.org'

ruby '2.1.2'

gem 'rails', '~> 4.1.0'

# Servers
gem 'pg'
gem 'unicorn', platform: :ruby
gem 'dalli'

# Tools, Utilities
gem 'orm_adapter'           # Common function for different data storage
gem 'rails_config'          # Configure app
gem 'kaminari'              # Paginator
gem 'resque'                # Delayed Job
gem 'mailcatcher'           # View sent emails
gem 'awesome_print'         # Print in console
gem 'high_voltage', '~> 2.2.0'

# I18n
gem 'rails-i18n'
gem 'i18n-js'

# Profiling, Monitoring
gem 'rack-mini-profiler'
gem 'flamegraph'
gem 'newrelic_rpm'
gem 'airbrake'
# TODO: LogAnalyzer


# Assets
gem 'sass-rails',   '~> 4.0.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'slim-rails'

gem 'bower-rails'
gem 'compass-rails'
gem 'uglifier',       '>= 1.3.0'

gem 'gon'

# gem 'oily_png'
# gem 'remotipart',     '~> 1.2'

gem 'jquery-rails'                   # jQuery UJS

# Sap
gem 'sap', path: './components/sap'
# gem 'sap', git: 'git@github-sap:martsoft/sap.git'

# Sap override
gem 'image_thread', '~> 0.1.0'
# gem 'image_thread', path: '../image_thread'
gem 'rails_admin_nestable', branch: 'master'

group :development, :test do
  # Deploy
  gem 'capistrano',         '~> 3.2.1'
  gem 'capistrano-rails',   '~> 1.1'
  gem 'capistrano-bundler'
  gem 'capistrano-rvm'

  gem 'rspec-rails', '~> 3.0.0.beta'
  gem 'minitest'
  gem 'spring'
end

group :development do
  # Optimization
  gem 'rails_best_practices'
  gem 'bullet'

  # Errors
  # gem 'better_errors'
  # gem 'binding_of_caller'

  # Profiling
  #gem 'ruby-prof'
end

group :test do
  gem 'factory_girl_rails'
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'database_cleaner'
  gem 'shoulda-matchers'
end