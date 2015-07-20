Rails.application.routes.draw do

  root to: "pages#index"
  namespace :api, defaults: { format: :json } do
    resources :shops
    resources :reservations
    resources :reviews, only: [:new, :create, :show, :edit, :update, :destroy]
    resources :users, only: [:create, :show, :update, :destroy, :index]
    resource :session, only: [:show, :create, :destroy]
  end


end
