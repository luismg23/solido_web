Rails.application.routes.draw do
  mount ActionCable.server => '/cable'

  devise_for :users, controllers: { registrations: 'users/registrations' }
  match '/users',   to: 'users#index',   via: 'get'
  resources :banks
  resources :companies
  resources :suppliers
  resources :budgetlines
  resources :backups
  resources :home
  resources :bulk_upload
  resources :budgets do
    member do
      get 'details'
    end
  end
  resources :checks do
    member do
      get 'details'
    end
  end
  resources :details
  resources :searchs
  get '/checks/authorize/:id', to: 'checks#authorize', as: 'authorize_check'
  get '/checks/deauthorize/:id', to: 'checks#deauthorize', as: 'deauthorize_check'
  get 'budgets/:id/export', to: 'budgets#export', as: 'export_budget'
  get '/', to: redirect('home/index')
  resource :example, constraints: -> { Rails.env.development? }
  post 'bulkupload', to: 'bulk_upload#create', as: :bulkupload
  get 'bulkupload/download_layout', to: 'bulk_upload#download_layout', as: :download_layout
end
