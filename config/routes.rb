TailoredRepublic::Application.routes.draw do
  authenticated :user do
    root :to => 'home#index'
  end

  root :to => 'home#index'

  devise_for :users, skip: [:sessions, :registrations],
             controllers: { sessions: :sessions, registrations: :registrations }
  as :user do
    get 'login' => 'sessions#new', :as => :new_user_session
    post 'login' => 'sessions#create', :as => :user_session
    delete 'sign-out' => 'sessions#destroy', :as => :destroy_user_session
    post 'account' => 'registrations#create', :as => :user_registration
    put 'account' => 'registrations#update'
    delete 'account' => 'devise/registrations#destroy'
    get 'account' => 'registrations#edit', :as => :edit_user_registration
  end

  resources :users, only: [:show, :update, :destroy, :index, :edit]
  resources :customizations, only: [:show, :create, :update]
  resource  :cart, only: [:show]
  resource  :measurements, only: [:show, :create, :update]
  resources :products
  resources :coupons, except: [:show]
  resources :line_items, path: '/line-items', only: [:create, :destroy, :update]
  resources :tape_measure_requests, path: '/tape-measure-requests', only: [:index, :new, :create, :update] do
    collection do
      get 'thank_you', path: 'thank-you'
    end
  end
  resources :schedule_tailor_requests, path: '/tailor-requests', only: [:index, :new, :create, :update] do
    collection do
      get 'thank_you', path: 'thank-you'
    end
  end
  resources :orders, only: [:show, :new, :create, :index] do
    collection do
      post 'review'
      post 'new', path: 'new'
      get 'thank_you', path: 'thank-you'
    end
  end

  match '/shop/:category' => 'shop#index'
  match '/gift-cards' => 'shop#gift_cards', :as => 'gift_cards'
  match '/shop' => 'shop#index'
  match '/home' => 'home#index'
  match '/measurements/:initial_slide' => 'measurements#show'
  match '/checkout' => 'carts#checkout'
  match '/admin/orders' => 'orders#admin'
  match '/subscribe-to-newsletter' => 'mailing_list#subscribe', :as => 'subscribe_to_newsletter'
  match '/about' => 'pages#about'
  match '/faq' => 'pages#faq'
  match '/lookbook' => 'pages#lookbook'
  match '/partners' => 'pages#partners'
  match '/privacy-policy' => 'pages#privacy_policy'
  match '/process' => 'pages#process'
  match '/team' => 'pages#team'
  match '/terms-of-service' => 'pages#terms_of_service'
  match '/weddings' => 'pages#weddings'
  match '/top-picks' => 'pages#top_picks'

end