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
  resources :details
  get '/checks/authorize/:id', to: 'checks#authorize', as: 'authorize_check'
  get '/checks/deauthorize/:id', to: 'checks#deauthorize', as: 'deauthorize_check'

end
