Rails.application.routes.draw do
  get 'home/index'
  resources :debts

  root 'home#index'
end
