Rails.application.routes.draw do
  devise_for :users
  get 'home/index'
  resources :debts

  root 'home#index'
end
