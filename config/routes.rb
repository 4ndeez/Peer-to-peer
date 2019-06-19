Rails.application.routes.draw do
  get 'messages/index'
  get 'conversations/index'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :items
  resources :news
  get 'home/index'
  root 'home#index'
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }
  resources :users

  resources :conversations, only: [:index, :create] do
    resources :messages, only: [:index, :create]
  end

  get 'home/search', to: 'home#search', as: 'search'
end
