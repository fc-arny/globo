Sap::Application.routes.draw do
  namespace 'api' do
    # API v1.0
    namespace 'v1' do

      resources :goods          # Goods
      resources :stores         # Stores
      resources :categories     # Categories

      # Order
      resources :orders do
        resources :items, :controller => 'order_items'
      end

      # User
      resources :user do
        post 'auth', :on => :collection
      end


    end
  end

  scope :module => 'store' do
    match '/goods/(:store(/*categories))'  => 'goods#index', :via => :get      # Goods

    controller :order do
      match 'order' => :index, :via => :get
    end
  end

  scope :module => 'user' do
    get   '/login' => 'login#form'                 # Login form
    get   '/logout' => 'logout#do_logout'          # Logout

    get   '/register' => 'register#form'           # Register form

    get '/password'  => 'index#password'             # Restore password form
    post '/password'  => 'index#password_create'     # Restore password
    post '/password_reset' => 'index#password_reset' # Generate token for reset
    get '/password_reset_sent' => 'index#password_reset_sent'
  end

  # Main page
  root :to => 'common/index#main'

  # Common route
  match '/:controller/:action(.:format)', :defaults => {:action => 'index'}, :via => :get
end


# Load routes
#Sap::Application.routes.draw do
#  routes = %W(
#    api
#    store
#    admin
#    user
#    common)
#
#  routes.each do |name|
#    require Rails.root.join "config/routes/#{name}"
#  end
#
#end


