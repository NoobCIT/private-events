Rails.application.routes.draw do

  root 'static_pages#home'
  get     '/about',  to: 'static_pages#about'
  get     '/help',   to: 'static_pages#help'

  get     '/signup', to: 'users#new'
  post    '/signup', to: 'users#create'

  get     '/login',  to: 'sessions#new'
  post    '/login',  to: 'sessions#create'
  get     '/logout', to: 'sessions#destroy'

  resources :users, only: [:show]
  resources :events, only: [:new, :create, :index, :show]
end
