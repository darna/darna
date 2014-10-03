Rails.application.routes.draw do
  resources :things

  resources :projects do
    resources :things
  end

  devise_for :users
  root to: 'static#index'

  get 'api/p/:project_id/ping', to: 'things#ping'
  get 'api/p/:project_id/:id', to: 'things#get_api'
  post 'api/p/:project_id', to: 'things#post_api'
end
