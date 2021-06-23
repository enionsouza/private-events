Rails.application.routes.draw do
  get 'users/show'
  root to: 'events#index'
  devise_for :users
  resources :events, only: [:index, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
