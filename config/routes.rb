Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  resources :users do
    resource :addresses
  end
end
