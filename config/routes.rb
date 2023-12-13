Rails.application.routes.draw do
  root 'homes#top'
  resource :consumer, only: [:new, :create, :show]
  get 'login', to: "sessions#new"
  post 'login', to: "sessions#create"
  delete 'logout', to: "sessions#destroy"

  resources :tasks, only: [:index, :create, :new, :edit, :update, :destroy]

  # ... 他のコメントアウトされたルートや不要な行があれば確認

end

