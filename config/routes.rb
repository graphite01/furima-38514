Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'commodity_exhibitions#index'
  resources :commodity_exhibitions do
    resources :purchase_historys, only: [:index, :create]
  end
end
