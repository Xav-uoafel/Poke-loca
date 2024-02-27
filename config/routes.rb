Rails.application.routes.draw do
  devise_for :users

  root to: "pokemons#index"

  get "up" => "rails/health#show", as: :rails_health_check

resources :pokemons do
  resources :bookings, only: [:new, :create]
end
  resources :bookings, only: [:index, :show] do
    resources :reviews, only: [:new, :create]
  end
resources :bookings, only: [:destroy]
end
