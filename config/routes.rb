Gm::Application.routes.draw do
  # If JS is disabled
  get 'badbrowser' => 'common/index#badbrowser'

  # Main and other pages
  root :to => 'common/index#main'
  post '/static/:action' => 'common/static#:action', as: :static_post

  # Blog
  namespace :blog do
    get 'post/:post' => 'posts#show', as: :post
    get '(:category)' => 'index#index', as: :list
  end

  # Resipes
  namespace :recipes do

  end

  # User routes
  scope :module => 'user' do
    get 'account' => 'account#index'            # View profile

    get 'login' => 'login#form'                 # Login form
    get 'logout' => 'logout#logout'             # Logout

    get 'remember'  => 'password#form'             # Restore password form

    post 'password'  => 'index#password_create'     # Restore password
    post 'password_reset' => 'index#password_reset' # Generate token for reset
    get 'password_reset_sent' => 'index#password_reset_sent'

    match 'account/:action', :to => 'account#:action',:via => [:get]
  end

  # Store
  get 'store/list' => 'store/index#index' # View stores list
  get 'store/:url' => 'store/index#show'  # View stores list

  scope :module => 'store' do
    get '/goods(/*category)', to: 'goods#index', as: :goods      # Goods main page

    controller :order do
      get 'order/checkout' => :index
      get 'order' => :list
    end
  end

  # SAP
  mount Sap::Core::Engine => '/', as: 'sap'
  get 'logout' => 'logout#logout', as: 'destroy_user_session'

  # Common route
  match '/:controller/:action(.:format)', :defaults => {action: 'index'}, :via => :all

  # Error handler
  match '(errors)/:status', to: 'common/errors#show', constraints: {status: /\d{3}/}, via: :all

  # Static pages
  get '/*id',  to: 'pages#show', as: :static_page

  #require 'sidekiq/web'
  #
  #
  ## For Developers
  #mount Sidekiq::Web, at: '/admin/sidekiq'
  ## /newrelic - open profiler
end