Rails.application.routes.draw do
  resources :things

  resources :projects do
    resources :things
  end

  devise_for :users
  root to: 'static#index'
end
