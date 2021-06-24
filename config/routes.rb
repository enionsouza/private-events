Rails.application.routes.draw do
  get 'attendees/create'
  delete 'attendees/:event_id', to: 'attendees#destroy'
  root to: 'events#index'
  devise_for :users
  # resources :attendees, only: [:create, :destroy]
  resources :events, only: [:index, :show, :edit, :update, :destroy]
  get '/users/:id', to: 'users#show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
