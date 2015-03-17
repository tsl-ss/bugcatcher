Rails.application.routes.draw do

  root    'static_page#home'
  get     'static_page/home'

  resources :comments

  devise_for :users, controllers: { sessions: "users/sessions", registrations: "users/registrations" }
  resource :profile, except: [:new, :create]
  resources :projects do
    resources :releases do
      resources :reports
      member do
        get :close
      end
    end
  end
end
