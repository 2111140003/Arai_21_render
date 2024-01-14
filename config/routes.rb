Rails.application.routes.draw do
  root 'homes#top'
  resource :consumer, only: [:new, :create, :show]
  get 'login', to: "sessions#new"
  post 'login', to: "sessions#create"
  delete 'logout', to: "sessions#destroy"
  resources :tasks
  resources :teams do
    get 'show', on: :member
  end
  get 'teams/show', to: "teams#show"
  get 'tasks/create'
  post 'tasks/create'
  # ... 他のコメントアウトされたルートや不要な行があれば確認


end

