Sap::Application.routes.draw do

  # Main page
  root :to => 'public::index#main'

  # Goods
  get 'goods' => 'store::goods#index'                 # Top offers
  get 'goods/product' => redirect('/goods')           # Redirect to top offers
  get 'goods/product/:id' => 'store::goods#product'   # View product
  get 'goods/search' => 'store::goods#search'         # Search products
  get 'goods/:cat1' => 'store::goods#category'        # View category
  get 'goods/:cat1/:cat2' => 'store::goods#category'  # View category

  # Users
  get 'login' => 'user::index#login_form'               # Login form
  post 'login' => 'user::index#login'                   # Login

  get 'logout' => 'user::index#logout'                  # Logout

  get 'register' => 'user::index#register_form'         # Register form
  post 'register' => 'user::index#create'               # Register form

  get 'password'  => 'user::index#password'             # Restore password form
  post 'password'  => 'user::index#password_create'     # Restore password
  post 'password_reset' => 'user::index#password_reset' # Generate token for reset
  get 'password_reset_sent' => 'user::index#password_reset_sent'

  # Admin Panel
  namespace :admin do
    get 'index/index'
  end

  # API
  namespace 'api' do
    # API v1.0
    namespace 'v1' do
      # Goods
      resources :goods do
        get 'search', :on => :collection
      end
      # Categories
    end
  end



  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.


  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  namespace "admin" do
    resources :goods
    resources :good_lists
  end

end
