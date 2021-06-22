Rails.application.routes.draw do
  root to: 'events#index'
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }
  resources :events, only: [:index, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
