TailoredRepublic::Application.routes.draw do
  resources :customers


  resources :carts


  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users
  resources :customizations
  match "/shop" => "shop#index"
  match "/shop/suits" => "shop#index"
  #match "/shop/shirts" => "shop#shirts"
  #match "/shop/vests" => "shop#vests"
  #match "/shop/pants" => "shop#pants"
  match "/home" => "home#index"
end