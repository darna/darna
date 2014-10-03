Rails.application.routes.draw do
  resources :things

  resources :projects

  devise_for :users
  root to: 'static#index'
end
