Rails.application.routes.draw do
  root  'homes#top'
  resource :consumer, only: [:new, :create, :show]
  get 'login', to: "sessions#new"
  post 'login', to: "sessions#create"
  delete 'logout', to: "sessions#destroy"
  #root "tasks#index"
#   patch '/tasks/:id', to: 'tasks#update', as: 'update_task'
#   get 'team/new'
#   get 'team/create'
#   resources :sessions, only: [:new, :create]
#   resources :user
#   get    '/login',   to: 'sessions#new'
#   post   '/login',   to: 'sessions#login'
#   delete '/logout',  to: 'sessions#destroy'
#   root "sessions#login"
#   # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

#   resources :tasks , only: [:create, :new, :edit, :update, :destroy]
#   get 'tasks/create'
#   post 'tasks/create'
  
  
  
#   # Defines the root path route ("/")
#   # root "articles#index"
end
