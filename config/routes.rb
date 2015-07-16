Rails.application.routes.draw do

  root to: "pages#index"
  namespace :api, defaults: { format: :json } do
    resources :shops
    resources :reservations
    resources :users, only: [:create, :show, :update, :destroy]
    resource :session, only: [:show, :create, :destroy]
  end


end
