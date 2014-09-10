Gm::Application.routes.draw do
  # If JS is disabled
  get :badbrowser, to: 'common/index#badbrowser'

  # Main and other pages
  root to: 'common/index#main'

  post '/static/:action', to: 'common/static#:action', as: :static_post

  # Store
  scope module: :store do
    get '/goods(/*category)', to: 'goods#index', as: :goods
    get '/order(/*act)', to: 'order#index', as: :order
  end

  # Blog
  namespace :blog do
    get 'post/:post', to: 'posts#show', as: :post
    get '(:category)', to: 'index#index', as: :list
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