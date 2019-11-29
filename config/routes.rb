Rails.application.routes.draw do
  get 'card/new'

  get 'card/show'

  devise_for :users, module: :users, controllers: {
    :registrations => 'users/registrations'
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
  # 石原
  # このファイルのコントローラは仮のため、ディレクトリ構造に合わせて各ビュー内のパスも合わせる事。
  resources :mypage, only: :index do
    collection do
      get 'notification' => 'mypage#notification'
      get 'todo' => 'mypage#todo'
      get 'purchase' => 'mypage#purchase'
      get 'purchased' => 'mypage#purchased'
      get 'logout' => 'mypage#logout'
      get 'identification' =>'mypage#identification'
      get 'profile' => 'mypage#profile'
      namespace :card do
        get '/' => '/mypage/card#index'
        get 'new' => '/mypage/card#new'
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
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :trade, except: :index do
  end

  resources :products, except: :index do
    member do
      get :confirmation
    end 
  resources :transaction do
    collection do
      post 'pay/:id' => 'products#pay', as: 'pay'
    end
  end
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :products, except: :index
  root "homes#index"
end
