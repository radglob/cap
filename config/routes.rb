Rails.application.routes.draw do
  mount Avo::Engine, at: Avo.configuration.root_path
  devise_for :users
  root 'home#index'

  get 'board', to: 'board#index'
  get 'committees', to: 'committees#index'
  get 'calendar', to: 'calendar#index'

  resources :users do
    resource :addresses
    resource :validated_addresses
  end
end
