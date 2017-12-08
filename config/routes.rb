Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'

  resources :users, only: [:dashboard] do
    member do
      get 'dashboard', to: "users#dashboard"
    end
  end

  resources :trips, only: [:new, :create, :edit, :update, :destroy] do
    resources :visits, only: [:create, :destroy]
  end

  resources :activities, only: [:index, :show, :create, :update, :destroy]
end
