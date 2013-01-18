TailoredRepublic::Application.routes.draw do
  authenticated :user do
    root :to => 'home#index'
  end

  root :to => 'home#index'

  devise_for :users, controllers: { sessions: :sessions, registrations: :registrations }

  resources :users, only: [:show, :update, :destroy, :index]
  resources :customizations, only: [:show, :create, :update]
  resources :customers
  resource  :cart, only: [:show, :create, :update, :destroy]
  resource  :measurements, only: [:show, :create, :update]
  resources :products
  resources :line_items, only: [:create, :destroy]
  resources :orders, only: [:show, :new, :create] do
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
  match '/faq' => 'pages#faq'
  match '/team' => 'pages#team'
  match '/weddings' => 'pages#weddings'
  match '/measuring_tape' => 'pages#measuring_tape'
  match '/new_tape_address' => 'pages#new_tape_address'

  #match "/shop/shirts" => "shop#shirts"
  #match "/shop/vests" => "shop#vests"
  #match "/shop/pants" => "shop#pants"
end