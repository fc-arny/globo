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
    end
  end
end