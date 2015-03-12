Rails.application.routes.draw do
  get 'releases/new'

  get 'releases/edit'

  get 'releases/show'

  get 'releases/delete'

  root    'static_page#home'
  get     'static_page/home'

  devise_for :users
  resource :profile, except: [:new, :create]
  resources :projects
end
