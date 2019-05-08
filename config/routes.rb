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
  # カーシェア
  resources :cars, only: [:show, :new, :edit, :create, :update, :destroy]

end
