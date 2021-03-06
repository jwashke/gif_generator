Rails.application.routes.draw do
  root to: 'home#index'
  resources :users, only: [:new, :create, :show]
  namespace :admin do
    resources :categories, only: [:new, :create, :index, :destroy, :show], param: :search
    resources :gifs, only: [:create]
  end

  resources :categories, only: [:show, :index], param: :search
  resources :favorites, only: [:create, :destroy]

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
end
