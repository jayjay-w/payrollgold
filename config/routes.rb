Rails.application.routes.draw do
  resources :companies
  devise_for :users
  get 'dashboard/index'
  resources :dashboards
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'dashboard#index'
end
