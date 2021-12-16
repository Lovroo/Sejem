Rails.application.routes.draw do
  get 'messages/index'
  get 'conversations/index'
  resources :categories
  devise_for :users
  resources :listings,
  controllers: { sessions: 'users/sessions' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
  resources :cities, only: :index
  resources :states, only: :index

  resources :conversations, only: [:index, :create] do
    resources :messages, only: [:index, :create]
  end
end
