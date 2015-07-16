Rails.application.routes.draw do

  root to: "pages#index"
  resources :users
  resource :session, only: [:new, :create, :destroy]
  namespace :api, defaults: { format: :json } do
    resources :shops
    resources :reservations
  end


end
