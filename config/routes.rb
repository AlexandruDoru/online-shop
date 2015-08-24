Rails.application.routes.draw do
 
  namespace :admin do
    resources :product_categories
    resources :addresses
    resources :users
    resources :payments
    resources :orders
    resources :main_categories
    resources :products
  end

  get 'admin/' => 'admin#dashboard', :as => 'admin'
  get '/' => 'shop#index', :as => 'index'
  get 'product_category/:id' => 'shop#product_category', as: 'product_category'
  get 'product/:id' => 'shop#product', as: 'product'
  post 'product/:id/add_to_cart' => 'shop#add_to_cart', as: 'add_to_cart'
  post 'product/:id/delete_from_cart' => 'shop#delete_from_cart', as: 'delete_from_cart'
  get 'checkout' => 'shop#checkout', as: 'checkout'
  post 'pay' => 'shop#pay'
  get 'main_category/:id' => 'shop#main_category', as: 'main_category'
  get 'customer/:id' => 'shop#customer', as: 'customer'
  get 'add_address/:id' => 'shop#add_address', as: 'add_address'
  post 'create_address' => 'shop#create_address', as: 'create_address'
  
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]
  resources :documents
  
  root to: "shop#main_category"
end
