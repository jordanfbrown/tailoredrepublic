TailoredRepublic::Application.routes.draw do
  authenticated :user do
    root :to => 'home#index'
  end

  root :to => 'home#index'

  devise_for :users, controllers: { sessions: :sessions, registrations: :registrations }

  resources :users
  resources :customizations
  resources :customers
  resource  :cart
  resource  :measurements
  resources :products
  resources :line_items
  resources :orders do
    collection do
      post 'review'
      post 'new', path: 'new'
    end
  end

  match '/shop/:category' => 'shop#index'
  match '/shop' => 'shop#index'
  match '/home' => 'home#index'
  match '/template' => 'template#index'
  match '/checkout' => 'carts#checkout'
  match '/thank_you' => 'orders#thank_you'

  #match "/shop/shirts" => "shop#shirts"
  #match "/shop/vests" => "shop#vests"
  #match "/shop/pants" => "shop#pants"
end