Rails.application.routes.draw do

  get 'sessions/new'

  root 'static_pages#home'
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/contact', to: 'static_pages#contact'
  get  '/subject', to: 'static_pages#subject'       # 教科ネタのHome
  get  '/carshare', to: 'static_pages#carshare'     # カーシェアのHome

  get  '/signup',  to: 'users#new'
  post '/signup',  to: 'users#create'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  
  resources :users

  # 教科ネタ
  resources :articles, only: [:show, :new, :edit, :create, :update, :destroy]
  
  # いいねした数を求める
  resources :users do
    member do
      get :gooding
    end
  end

  # いいねされた数を求める
  resources :articles do
    member do
      get :gooders
    end
  end

  # いいねモデルのルーティング
  resources :goods, only: [:create, :destroy]




  # カーシェア
  resources :cars, only: [:show, :new, :edit, :create, :update, :destroy]

  # 予約した数を求める
  resources :users do
    member do
      get :reserving
    end
  end

  # 予約された数を求める
  resources :cars do
    member do
      get :reservers
    end
  end

  # 予約モデルのルーディング
  resources :reserves, only: [:create, :destroy]

  # カレンダーで管理する予約情報ルーティング
  resources :events
  get '/rlist',   to: 'events#rlist'
  get '/rmanage',   to: 'events#rmanage'

end
