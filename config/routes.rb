Rails.application.routes.draw do

  get '/leaderboard' => 'leaderboard#index', as: :leaderboard

  root    'static_page#home'
  get     'static_page/home'

  resources :reports do
    resources :comments
  end

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

  resources :releases, only: [] do
    resources :reports
  end

  get '/report_accepted/:id',   :controller => "reports",
                                :action => "report_accepted",
                                :as => "report_accepted"

  get '/report_denied/:id',     :controller => "reports",
                                :action => "report_denied",
                                :as => "report_denied"

end
