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

  resources :users, only: [:show, :update, :destroy, :index, :edit], path: '/admin/users'
  resources :customizations, only: [:show, :create, :update]
  resource  :cart, only: [:show]
  resource  :measurements, only: [:show, :create, :update]
  resources :products, only: [:show, :index, :create, :update] do
    resources :reviews, only: [:new, :edit] do
      collection do
        get 'paginated'
      end
    end
  end
  resources :products, only: [:new, :edit, :admin_index], path: '/admin/products' do
    collection do
      get 'index', action: 'admin_index'
    end
  end
  resources :coupons, except: [:show], path: '/admin/coupons' do
    collection do
      get 'help'
    end
  end
  resources :line_items, path: '/line-items', only: [:create, :destroy, :update]
  resources :tape_measure_requests, only: [:index, :update], path: '/admin/tape-measure-requests'
  resources :tape_measure_requests, only: [:new, :create], path: '/tape-measure-requests' do
    collection do
      get 'thank_you', path: 'thank-you'
    end
  end
  resources :schedule_tailor_requests, only: [:index, :update], path: '/admin/tailor-requests'
  resources :schedule_tailor_requests, only: [:new, :create], path: '/tailor-requests' do
    collection do
      get 'thank_you', path: 'thank-you'
    end
  end
  resources :orders, only: [:admin_index, :show], path: '/admin/orders' do
    collection do
      get 'index', action: 'admin_index'
    end
  end
  resources :orders, only: [:new, :create, :index] do
    collection do
      post 'review'
      post 'new', path: 'new'
      get 'thank_you', path: 'thank-you'
    end
  end
  resources :referrals, only: [:index] do
    collection do
      get 'invite/:referral_code', :action => 'invite'
      post 'email-friends', :action => 'email_friends'
    end
  end
  resources :reviews, only: [:update, :create, :index]
  resources :reviews, only: [:admin_index], path: '/admin/reviews' do
    collection do
      get 'index', action: 'admin_index'
    end
  end
  resources :testimonials, only: [:index, :update, :create]
  resources :testimonials, except: [:index, :update, :create], path: '/admin/testimonials' do
    collection do
      get 'index', action: 'admin_index'
    end
  end

  match '/shop/:category' => 'shop#index'
  match '/gift-cards' => 'shop#gift_cards', :as => 'gift_cards'
  match '/shop' => 'shop#index'
  match '/home' => 'home#index'
  match '/measurements/:initial_slide' => 'measurements#show'
  match '/subscribe-to-newsletter' => 'mailing_list#subscribe', :as => 'subscribe_to_newsletter'
  match '/about' => 'pages#about'
  match '/admin' => 'pages#admin'
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