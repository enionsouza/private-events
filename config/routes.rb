Rails.application.routes.draw do
  root to: 'events#index'
  devise_for :users
  resources :events, only: [:index, :show]
  get '/users/:id', to: 'users#show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
