Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: :omniauth_callbacks }
  root controller: :main, action: :index
  resources :sessions, only: [:create, :show]
  resources :transactions, only: [:new, :create]
	match 'register', to: 'main#index', via: [:get]
  match 'login', to: 'main#index', via: [:get]
  match 'addsession', to: 'main#index', via: [:get, :post]
  match 'startsession', to: 'main#index', via: [:get]
  match 'mysessions', to: 'main#index', via: [:get]
end
