Rails.application.routes.draw do

  root    'static_page#home'
  get     'static_page/home'

  resource :profile, except: [:new, :create]
  devise_for :users
end
