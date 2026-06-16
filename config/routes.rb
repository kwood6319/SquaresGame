Rails.application.routes.draw do
  root to: "games#new"

  resources :games, only: [:new, :create, :show, :destroy] do
    resources :turns, only: [:create]
  end

  get "up" => "rails/health#show", as: :rails_health_check
end
