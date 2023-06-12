Rails.application.routes.draw do
  resources :tasks
  resources :goals
  resources :categories
  resources :labels
  devise_for :users
  root to: "home#index"
end
