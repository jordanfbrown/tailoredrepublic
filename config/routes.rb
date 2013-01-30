TailoredRepublic::Application.routes.draw do
  authenticated :user do
    root :to => 'home#index'
  end

  root :to => 'home#index', constraints: lambda { |req| req.cookies['access_code'] == ENV['ACCESS_CODE'] }
  root :to => 'pages#coming_soon', constraints: lambda { |req| req.cookies['access_code'] != ENV['ACCESS_CODE'] }

  devise_for :users, controllers: { sessions: :sessions, registrations: :registrations }

  resources :users, only: [:show, :update, :destroy, :index]
  resources :customizations, only: [:show, :create, :update]
  resources :customers
  resource  :cart, only: [:show, :create, :update, :destroy]
  resource  :measurements, only: [:show, :create, :update]
  resources :products
  resources :coupons, except: [:show]
  resources :line_items, only: [:create, :destroy]
  resources :orders, only: [:show, :new, :create, :index] do
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
  match '/gift_cards' => 'shop#gift_cards'
  match '/faq' => 'pages#faq'
  match '/get_tailored' => 'pages#get_tailored'
  match '/authenticate_access_code' => 'pages#authenticate_access_code'
  match '/request_access_code' => 'pages#request_access_code'
  match '/coming_soon' => 'pages#coming_soon'
  match '/press' => 'pages#press'
  match '/team' => 'pages#team'
  match '/team' => 'pages#team'
  match '/weddings' => 'pages#weddings'
  match '/measuring_tape' => 'pages#measuring_tape'
  match '/new_tape_address' => 'pages#new_tape_address'
  match '/schedule_tailoring' => 'pages#schedule_tailoring'
  match '/create_schedule_tailoring' => 'pages#create_schedule_tailoring'
  match '/subscribe_to_newsletter' => 'mailing_list#subscribe'

  #match "/shop/shirts" => "shop#shirts"
  #match "/shop/vests" => "shop#vests"
  #match "/shop/pants" => "shop#pants"
end