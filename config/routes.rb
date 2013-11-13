BillysBbqShack::Application.routes.draw do
  resources :categories
  resources :order_items
  resources :items
  resource :cart
  resources :orders
  resources :admin_orders
  resources :admin_items
  
  match '/auth/:provider/callback', to: 'sessions#create', via: :get

  match "/login" => redirect("/auth/twitter"), as: :login, via: :get
  match "/logout" => "sessions#destroy", as: :logout, via: :get
  
  match "/" => "front#index", as: :front, via: :get
  match "/admin" => "admin#index", via: :get
  match "/contact" => "contact#show", via: :get
  match "/about" => "about#show", via: :get

  match "/checkout" => "checkout#show", via: :get
  match "/thank_you" => "thank_you#show", via: :get
  # match "/admin_items" => "admin_items#destroy", via: :delete

end
