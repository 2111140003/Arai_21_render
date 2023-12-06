Rails.application.routes.draw do
  get 'task/new'
  get 'task/create'
  get 'task/edit'
  get 'team/new'
  get 'team/create'
  resources :sessions, only: [:new, :create]
  resources :user
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#login'
  delete '/logout',  to: 'sessions#destroy'
  root "sessions#login"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
