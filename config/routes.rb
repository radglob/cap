Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  resources :users do
    resources :address, only: %i[new create edit update]
  end
end
