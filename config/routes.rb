Rails.application.routes.draw do

  root to: "pages#index"
  namespace :api, defaults: { format: :json } do
    get "/search", to: "shops#search"
    resources :shops
    resources :reservations
    resources :reviews, only: [:index, :new, :create, :show, :edit, :update, :destroy]
    resources :users, only: [:create, :show, :update, :destroy, :index]
    resource :session, only: [:new, :show, :create, :destroy]
  end

  get "/auth/google_oauth2/callback/", to: "sessions#omniauth"


end
