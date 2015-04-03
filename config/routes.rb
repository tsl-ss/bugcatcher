Rails.application.routes.draw do
  root    'static_page#home'

  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations"
  }

  resource :profile, except: [:new, :create]

  resources :projects do
    resources :releases do
      resources :reports
    end
  end

  resources :reports, only: [] do
    resources :comments
  end

  resources :releases, only: [] do
    resources :reports
  end

  resource :report_status, only: [:update], controller: "report_status"

  get '/leaderboard' => 'leaderboard#index', as: :leaderboard
end