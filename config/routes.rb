Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'

  resources :trip, only: [:show, :new, :create, :edit, :update, :destroy] do
    resources :visit, only: [:create, :destroy]
  end
  resources :activity, only: [:index, :show, :create, :update, :destroy]
end
