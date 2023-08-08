Rails.application.routes.draw do
  resources :users
  resources :debts

  root 'users#index'
end
