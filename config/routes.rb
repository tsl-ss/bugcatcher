Rails.application.routes.draw do
  root    'static_page#home'
  get     'static_page/home'

  devise_for :users
  resource :profile, except: [:new, :create]
  resources :projects
end
