source 'https://rubygems.org'
source 'http://gems.github.com'

gem 'rails', '4.0.0.rc2'

gem 'pg'
#
gem 'unicorn', :platform => :ruby
gem 'haml-rails'
gem 'rails-i18n'
gem 'unicode'
gem 'foreigner'             # Foreign key
gem 'orm_adapter'           # Common function for different data storage
gem 'rails_config'          # Configure app
gem 'jsend-rails'           # API format specification

# Profiling, Monitoring
#gem 'rack-mini-profiler'
#gem 'newrelic_rpm'
#gem 'ruby-prof'
#gem 'airbrake'


# Sidekiq
gem 'sidekiq'
gem 'sinatra', require: false
gem 'slim'

# Gems used only for assets and not required
# in production environments by default.

gem 'sass-rails',   '~> 4.0.0.rc1'
gem 'coffee-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'

gem 'jquery-rails', '~>3.0.1'     # jQuery
gem 'rails-backbone'              # Backbone
gem 'bootstrap-sass'              # Twitter bootstrap
gem 'backbone-support'            # Backbone Support
gem 'haml_coffee_assets'          # JS Templates for backbone

# Sap gems
gem 'sap', :path => 'sap'

# @TODO: Rails 4 - проверка параметров должна быть в контроллере  http://habrahabr.ru/company/engineyard/blog/170473/
# Сессию хранить в кеше и получать данные по id
gem 'protected_attributes'
gem 'activerecord-session_store'


group :development do
  # Annotate models
  gem 'migration_comments'
  gem 'annotate', ">=2.5.0" # Generate model annotation
  # Errors
  gem 'better_errors'
  gem 'binding_of_caller'
  # Debug
  #gem "coffee-script-redux-debugger", :git => "git://github.com/JetBrains/coffee-script-redux-debugger.git"
end

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use Jbuilder & draper for JSON
gem 'jbuilder'
gem 'draper', '~> 1.0'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
