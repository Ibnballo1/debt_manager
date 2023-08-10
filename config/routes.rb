Rails.application.routes.draw do
  resources :users do
    resources :debts
  end

  root 'users#index'
end
