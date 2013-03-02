TailoredRepublic::Application.routes.draw do
  authenticated :user do
    root :to => 'home#index'
  end

  root :to => 'home#index'

  devise_for :users, controllers: { sessions: :sessions, registrations: :registrations }

  resources :users, only: [:show, :update, :destroy, :index, :edit]
  resources :customizations, only: [:show, :create, :update]
  resources :customers
  resource  :cart, only: [:show, :create, :update, :destroy]
  resource  :measurements, only: [:show, :create, :update]
  resources :products
  resources :coupons, except: [:show]
  resources :line_items, only: [:create, :destroy, :update]
  resources :tape_measure_requests, only: [:index, :new, :create, :update]
  resources :schedule_tailor_requests, path: 'tailorings', only: [:index, :new, :create, :update]
  resources :orders, only: [:show, :new, :create, :index] do
    collection do
      post 'review'
      post 'new', path: 'new'
    end
  end

  match '/shop/:category' => 'shop#index'
  match '/gift_cards' => 'shop#gift_cards'
  match '/shop' => 'shop#index'
  match '/home' => 'home#index'
  match '/measurements/:initial_slide' => 'measurements#show'
  match '/checkout' => 'carts#checkout'
  match '/admin/orders' => 'orders#admin'
  match '/thank_you' => 'orders#thank_you'
  match '/subscribe_to_newsletter' => 'mailing_list#subscribe'
  match '/about' => 'pages#about'
  match '/faq' => 'pages#faq'
  match '/get_tailored' => 'pages#get_tailored'
  match '/lookbook' => 'pages#lookbook'
  match '/partners' => 'pages#partners'
  match '/privacy-policy' => 'pages#privacy_policy'
  match '/process' => 'pages#process'
  match '/team' => 'pages#team'
  match '/terms-of-service' => 'pages#terms_of_service'
  match '/weddings' => 'pages#weddings'
  match '/top_picks' => 'pages#top_picks'

end