Rails.application.routes.draw do
  # Routes for User resource
  resource :profile, except: [:new, :create]
end
