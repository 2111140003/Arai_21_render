Rails.application.routes.draw do
  root 'homes#top'
  resources :consumers
  get 'login', to: "sessions#new"
  post 'login', to: "sessions#create"
  delete 'logout', to: "sessions#destroy"

  resources :teams, only: [:index, :show, :new, :create] do
    resources :tasks, only: [:edit, :update , :edit]
  end

  resources :tasks

  # ... 他のルート
end
