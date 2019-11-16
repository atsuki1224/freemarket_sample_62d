Rails.application.routes.draw do
  # 石原
  # このファイルのコントローラは仮のため、ディレクトリ構造に合わせて各ビュー内のパスも合わせる事。
  resources :mypage, only: :index do
    collection do
      get 'notification' => 'mypage#notification'
      get 'todo' => 'mypage#todo'
      get 'purchase' => 'mypage#purchase'
      get 'purchased' => 'mypage#purchased'
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

  root "homes#index"
  get 'user/logout' => 'users#logout'
end
