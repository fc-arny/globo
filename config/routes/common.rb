Sap::Application.routes.draw do
  # Main page
  root :to => 'common/index#main'

  # Common route
  match '/:controller/:action(.:format)', :defaults => {:action => 'index'}, :via => :get
end
