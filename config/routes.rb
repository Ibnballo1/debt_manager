Rails.application.routes.draw do
  resources :debts

  root 'debts#index'
end
