Rails.application.routes.draw do
  root "tasks#index"
  patch '/tasks/:id', to: 'tasks#update', as: 'update_task'
  get 'team/new'
  get 'team/create'
  resources :tasks , only: [:create, :new, :edit, :update, :destroy]
  get 'tasks/create'
  post 'tasks/create'
  delete 'tasks/:id' => 'tasks#destroy'
  # Defines the root path route ("/")
  # root "articles#index"
end
