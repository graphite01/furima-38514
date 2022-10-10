Rails.application.routes.draw do
  devise_for :users
  root to: 'commodity_exhibitions#index'
  resources :commodity_exhibitions, only: [:index, :new, :create, :show, :edit, :update]
end
