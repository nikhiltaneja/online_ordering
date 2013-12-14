BillysBbqShack::Application.routes.draw do
  devise_for :users
  devise_scope :user do
    get "/logout" => "devise/sessions#destroy", as: :logout
    get "/login" => "devise/sessions#new", as: :login
  end
  
  # resources :order_items
  resources :admin_orders
  resources :admin_items
  resources :restaurants

  root to: 'restaurants#index'

  match "/admin" => "admin#index", via: :get
  match "/contact" => "contact#show", via: :get
  match "/about" => "about#show", via: :get

  match "/customers" => "customer#index", via: :get

  # match '/:slug' => "categories#index", via: :get

  scope '/:slug' do
    resources :categories
    get '/' => 'categories#index', as: 'home'
    resources :order_items
    resources :items
    resources :orders

    get "/thank_you" => "thank_you#show"

    get "/checkout" => "checkout#show"

    get "cart" => "carts#index"
  end
end
