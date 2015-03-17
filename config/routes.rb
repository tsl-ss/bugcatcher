Rails.application.routes.draw do

  get 'reports/new'

  get 'reports/show'

  get 'reports/edit'

  get 'reports/delete'

  get 'reports/create'

  root    'static_page#home'
  get     'static_page/home'

  devise_for :users, controllers: { sessions: "users/sessions", registrations: "users/registrations" }
  resource :profile, except: [:new, :create]
  resources :projects do
    resources :releases do
      member do
        get :close
      end
    end
  end
end
