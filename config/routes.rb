Rails.application.routes.draw do
  root to: 'events#index'
  delete 'attendances/:id/:event_id', to: 'attendances#destroy'
  devise_for :users, controllers: { registrations: 'users/registrations' }
  # resources :attendees, only: [:create, :destroy]
  resources :events
  get '/users/:id', to: 'users#show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
