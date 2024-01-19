Rails.application.routes.draw do
  devise_for :users
  resources :banks
  resources :companies
  resources :suppliers
  resources :budgetlines
  resources :backups
  resources :budgets do
    member do
      get 'details'
    end
  end
  resources :checks
end
