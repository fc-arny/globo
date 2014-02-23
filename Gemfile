source 'https://rubygems.org'

gem 'rails', '~> 4.0.0'

# Servers
gem 'pg'
gem 'unicorn', :platform => :ruby
gem 'dalli'

# Tools, Utilities
gem 'foreigner'             # Foreign key
gem 'orm_adapter'           # Common function for different data storage
gem 'rails_config'          # Configure app
gem 'kaminari'              # Paginator
gem 'resque'                # Delayed Job
gem 'mailcatcher'           # View sent emails
gem 'awesome_print'         # Print in console

# I18n
gem 'rails-i18n'
gem 'i18n-js'

# Profiling, Monitoring
gem 'rack-mini-profiler'
# Erbit
# Scoupapp
# LogAnalyzer
#gem 'newrelic_rpm'
#gem 'ruby-prof'
#gem 'airbrake'

# Assets
gem 'sass-rails'
gem 'coffee-rails'
gem 'haml-rails'

gem 'compass-rails', '~> 1.1.2'
gem 'uglifier', '>= 1.3.0'
gem 'oily_png'
gem 'remotipart', '~> 1.2'

gem 'jquery-rails', '~>3.0.1'        # jQuery
gem 'bootstrap-sass', '~> 3.0.3.0'   # Bootsrap
#gem 'rails-backbone'                # Backbone
#gem 'marionette-rails'              # Backbone Marionette
#gem 'haml_coffee_assets'            # JS Templates for backbone

# Deploy
gem 'capistrano'
gem 'capistrano_colors'
gem 'rvm-capistrano'

# Sap
gem 'sap', :path => './../sap'

group :development, :test do
  gem 'rspec-rails', '~> 3.0.0.beta'
  gem 'zeus', '>=0.13.4.pre2'
end

group :development do
  #gem 'spring'
  #gem 'spring-commands-rspec'
  gem 'quiet_assets'

  # Errors
  gem 'better_errors'
  gem 'binding_of_caller'

  # Debug
  gem 'intellij-coffee-script-debugger', :git => 'git://github.com/JetBrains/intellij-coffee-script-debugger.git'
end

group :test do
  gem 'factory_girl'
end