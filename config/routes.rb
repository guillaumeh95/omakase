Rails.application.routes.draw do
  devise_for :users, :controllers => { :invitations => 'users/invitations' }

  root to: 'pages#home'

  resources :users, only: [:dashboard] do
    member do
      get 'dashboard', to: "users#dashboard"
    end
  end

  resources :trips, only: [:show, :new, :create, :edit, :update, :destroy] do
    member do
      get 'send_trip', to: "trips#send_trip"
    end
    resources :visits, only: [:create, :destroy]
  end

  resources :activities, only: [:index, :show, :create, :update, :destroy]
end
