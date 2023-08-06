Rails.application.routes.draw do
  get 'debtors/index'
  get 'debtors/show'
  get 'debtors/new'
  get 'debtors/create'
  get 'debtors/edit'
  get 'debtors/update'
  get 'debtors/destroy'
  resources :users
  resources :debtors do
    resources :debts
  end

  root 'users#index'
end
