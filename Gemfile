source 'https://rubygems.org'
source 'http://gems.github.com'

gem 'rails', '4.0.0.rc1'

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
group :assets do
  gem 'sass-rails',   '~> 4.0.0.rc1'
  gem 'coffee-rails', '~> 4.0.0'
  gem 'uglifier', '>= 1.3.0'

  gem 'jquery-rails'                # jQuery
  gem 'rails-backbone'              # Backbone
  gem 'bootstrap-sass'              # Twitter bootstrap
  gem 'backbone-support'            # Backbone Support
  gem 'haml_coffee_assets'          # JS Templates for backbone
end

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

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
