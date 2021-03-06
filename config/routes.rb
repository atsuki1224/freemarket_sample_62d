Rails.application.routes.draw do
  devise_for :users, module: :users, controllers: {
    :registrations => 'users/registrations',
    :omniauth_callbacks =>  "users/omniauth_callbacks"
  }

  devise_scope :user do
    scope :signup do
      get '/' => 'users/registrations#signup'
      get '/registration' => 'users/registrations#registration'
      get '/sms_confirmation' => 'users/registrations#sms_confirmation'
      get '/sms_confirmation/sms/' => 'users/registrations#sms_confirmation_check'
      get '/address_confirmation' => 'users/registrations#address_confirmation'
      get '/card_confirmation' => 'users/registrations#card_confirmation'
      post '/complete' => 'users/registrations#complete'
    end
  end
  resources :mypage, only: :index do
    collection do
      get 'notification' => 'mypage#notification'
      get 'todo' => 'mypage#todo'
      get 'purchase' => 'mypage#purchase'
      get 'purchased' => 'mypage#purchased'
      get 'logout' => 'mypage#logout'
      get 'identification' =>'mypage#identification'
      get 'profile' => 'mypage#profile'
      patch 'profile_update' => 'mypage#profile_update'
      patch 'identification_update' => 'mypage#identification_update'
      namespace :card do
        get '/' => '/mypage/card#show'
        get 'create' => '/mypage/card#edit'
        post 'update' => '/mypage/card#update'
      end
      namespace :listings do
        get 'listing' => '/mypage/listings#listing'
        get 'in_progress' => '/mypage/listings#in_progress'
        get 'completed' => '/mypage/listings#completed'
      end
      namespace :review do
        get 'history' => '/mypage/reviews#index'
        get 'history/great' => '/mypage/reviews#great'
        get 'history/good' => '/mypage/reviews#good'
        get 'history/poor' => '/mypage/reviews#poor'
      end
      namespace :nice do
        get 'history' => '/mypage/nices#index'
      end
    end
  end

  resources :category, only: :show
  resources :brand, only: :show
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :trade, except: :index do
    collection do
      post 'pay/:id' => 'products#pay', as: 'pay'
    end
  end

  resources :products, except: :index do
    collection do
      get 'search'
    end
  end


  resources :products, except: :index do
    member do
      get :confirmation
    end
  end
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :products, except: :index
  resource :card, controller: :card do
    collection do
      post 'pay/:id' => 'card#pay', as: 'pay'
    end
  end




  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root "homes#index"
  get 'products/:id/edit' => 'products#update'

end
