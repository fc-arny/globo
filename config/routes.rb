require 'sidekiq/web'

Sap::Application.routes.draw do

  # Main page
  root :to => 'common::index#main'

  # Common
  match ':controller(/:action(/:id))(.:format)', :controller => /common\/[^\/]+/

  # Good
  get 'goods'                     => 'store::goods#index'               # Promo Page init backbone-app
  get 'goods/:store'              => 'store::goods#index'               # Store promo page
  get 'goods/:store/*categories'  => 'store::goods#index'               # Store promo page

  # Order(Basket)
  namespace :store do
    resource :order
  end

  #get 'goods/product' => redirect('/goods')            # Redirect to top offers
  #get 'goods/product/:id' => 'store::goods#product'    # View product
  #get 'goods/search' => 'store::goods#search'          # Search products

  # Users
  get   'login' => 'user::login#form'                 # Login form
  post  'login' => 'user::login#do_login'             # Login
  get   'logout' => 'user::logout#do_logout'          # Logout

  get   'register' => 'user::register#form'           # Register form
  post  'register' => 'user::register#create'         # Register action

  get 'password'  => 'user::index#password'             # Restore password form
  post 'password'  => 'user::index#password_create'     # Restore password
  post 'password_reset' => 'user::index#password_reset' # Generate token for reset
  get 'password_reset_sent' => 'user::index#password_reset_sent'

  # API
  namespace 'api' do
    # API v1.0
    namespace 'v1' do
      # Goods
      resources :goods do
        get 'search', :on => :collection
      end
      # Stores
      resources :stores
      # Categories
      resources :categories
    end
  end

  # Admin Panel
  namespace "admin" do
    get '/' => 'index#index'
    resources :goods
    resources :good_lists
  end

  # For Developers
  mount Sidekiq::Web, at: '/admin/sidekiq'

end
