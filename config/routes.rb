Rails.application.routes.draw do
  devise_for :users
  root 'home#index'

  authenticate :user, ->(user) { user.admin? } do
    mount Avo::Engine, at: Avo.configuration.root_path
  end

  get 'board', to: 'board#index'
  get 'committees', to: 'committees#index'
  get 'calendar', to: 'calendar#index'

  resources :users do
    resource :addresses
    resource :validated_addresses
  end
end
