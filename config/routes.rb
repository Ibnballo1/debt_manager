Rails.application.routes.draw do
  resources :users do
    resources :debtors do
      resources :debts
    end
  end

  root 'users#index'
end
