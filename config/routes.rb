require 'sidekiq/web'

Sap::Application.routes.draw do

  # Main page
  root :to => 'common::index#main'

  # Common
  #match ':module/:controller(/:action(/*))'

  # Store module
  scope :module => 'store' do
    match '/goods/(:store(/*categories))'  => 'goods#index'      # Goods

    controller :order do
      match 'order' => :index
    end
  end

  # User module
  scope :module => 'user' do
    get   '/login' => 'login#form'                 # Login form
    post  '/login' => 'login#do_login'             # Login
    get   '/logout' => 'logout#do_logout'          # Logout

    get   '/register' => 'register#form'           # Register form
    post  '/register' => 'register#create'         # Register action

    get '/password'  => 'index#password'             # Restore password form
    post '/password'  => 'index#password_create'     # Restore password
    post '/password_reset' => 'index#password_reset' # Generate token for reset
    get '/password_reset_sent' => 'index#password_reset_sent'
  end


  # API
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
    end
  end

  # Admin Panel
  namespace "admin" do
    get '/' => 'index#index'
    resources :goods
    resources :good_lists
  end

  match '/:controller/:action(.:format)', :defaults => {:action => 'index'}

  # For Developers
  mount Sidekiq::Web, at: '/admin/sidekiq'
  # /newrelic - open profiler

end
