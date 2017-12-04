Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'

  resources :trips, only: [:show, :new, :create, :edit, :update, :destroy] do
    resources :visits, only: [:create, :destroy]
  end
  resources :activities, only: [:index, :show, :create, :update, :destroy]
end
