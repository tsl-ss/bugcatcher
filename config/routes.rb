Rails.application.routes.draw do
  # Routes for User resource
  resources :users, except: [:index]
end
