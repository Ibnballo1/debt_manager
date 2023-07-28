Rails.application.routes.draw do
  # get 'debts/index'
  resources :users do
    resources :debts
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
