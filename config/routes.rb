Rails.application.routes.draw do
  resources :users
  resources :debtors do
    resources :debts
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'users#index'
end
