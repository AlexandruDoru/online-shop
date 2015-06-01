Rails.application.routes.draw do
 
  namespace :admin do
    resources :product_categories
    resources :states
    resources :shipping_addresses
    resources :addresses
    resources :user_details
    resources :users
    resources :payments
    resources :order_lists
    resources :orders
    resources :discounts
    resources :related_products
    resources :product_attributes
    resources :descriptions
    resources :comments
    resources :keywords
    resources :main_categories
    resources :products
  end

  get 'admin/' => 'admin#dashboard', :as => 'admin'
  get '/' => 'shop#main_category', :as => 'main_category'

  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]
  resources :documents
  
  root to: "shop#main_category"
end
