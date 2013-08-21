Sap::Application.routes.draw do


    # User routes

    scope :module => 'user' do
      get   'login' => 'login#form'                 # Login form
      get   'logout' => 'logout#logout'            # Logout

      get   'register' => 'user/register#form'           # Register form

      get 'password'  => 'index#password'             # Restore password form
      post 'password'  => 'index#password_create'     # Restore password
      post 'password_reset' => 'index#password_reset' # Generate token for reset
      get 'password_reset_sent' => 'index#password_reset_sent'


      get 'account', :to => 'account#index'              # View profile
      match 'account/:action', :to => 'account#:action',:via => [:get]
    end

    # Store
    scope :module => 'store' do
      match '/goods/(:store(/*categories))'  => 'goods#index', :via => :get      # Goods

      controller :order do
        get 'order/checkout' => :index
        get 'order' => :list
      end
    end

    # Admin
    namespace "admin" do
      get '/' => 'index#index'
      resources :goods
      resources :good_lists
    end


  # API
  mount Sap::Core::Engine => '/', :as => 'sap'


  # Main page
  root :to => 'common/index#main'

  # If JS is disabled
  get 'badbrowser' => 'common/index#badbrowser'

  # Common route
  match '/:controller/:action(.:format)', :defaults => {:action => 'index'}, :via => :get

  #require 'sidekiq/web'
  #
  #
  ## For Developers
  #mount Sidekiq::Web, at: '/admin/sidekiq'
  ## /newrelic - open profiler


end