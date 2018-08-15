Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # NESTED RESOURCE??
  # resources :users do
  #  resources :agencies, only: [ :new, :create, :edit ]
  # end

  resources :agencies

  root to: 'agencies#index'
end
