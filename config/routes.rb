BillysBbqShack::Application.routes.draw do
  devise_for :users
  devise_scope :user do
    get "/logout" => "devise/sessions#destroy", as: :logout
    get "/login" => "devise/sessions#new", as: :login
  end
  resources :categories
  resources :order_items
  resources :items
  resource  :cart
  resources :orders
  resources :admin_orders
  resources :admin_items
  resources :restaurants

  root to: 'categories#index'

  match "/admin" => "admin#index", via: :get
  match "/contact" => "contact#show", via: :get
  match "/about" => "about#show", via: :get

  match "/checkout" => "checkout#show", via: :get
  match "/thank_you" => "thank_you#show", via: :get
  match "/customers" => "customer#index", via: :get

end
