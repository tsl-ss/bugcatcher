Rails.application.routes.draw do
  # Routes for User resource
  resource :users, except: [:new, :create]
end
