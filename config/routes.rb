Rails.application.routes.draw do

  devise_for :users
  authenticated :user do
    root to: 'pages#dashboard'
  end

  root to: 'pages#home'

  resources :profiles, only: [:show, :new, :create, :edit, :update, :destroy] do
    resources :cards, only: [:show, :new, :create, :edit, :update, :destroy]
    resources :accounts, only: [:show, :new, :create, :edit, :update, :destroy]
    resources :transactions, only: [:index, :show, :new, :create]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
