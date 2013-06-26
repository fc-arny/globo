Sap::Application.routes.draw do

  # Load all routes' file
  Dir[Rails.root.join("config", "routes", "*.rb")].each{|r| load(r) }

  # Main page
  root :to => 'common/index#main'

  # Common route
  match '/:controller/:action(.:format)', :defaults => {:action => 'index'}, :via => :get
end