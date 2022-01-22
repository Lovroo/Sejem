Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  get 'messages/index'
  get 'conversations/index'
  resources :categories
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :listings,
  controllers: { sessions: 'users/sessions' }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'pages#home'
  resources :cities, only: :index
  resources :states, only: :index

  get 'search', to: "listings#search"
  get 'cat', to: "listings#cat"
  resources :conversations, only: [:index, :create] do
    resources :messages, only: [:index, :create]
  end
end
