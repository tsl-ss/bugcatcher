Rails.application.routes.draw do

  get 'leaderboard/index'

  root    'static_page#home'
  get     'static_page/home'

  devise_for :users, controllers: { sessions: "users/sessions", registrations: "users/registrations" }

  resource :profile, except: [:new, :create]

  resources :projects do
    resources :releases do
      member do
        get :close
      end
      resources :reports
    end
  end

  get '/report_accepted/:id',   :controller => "reports",
                                :action => "report_accepted",
                                :as => "report_accepted"

  get '/report_denied/:id',     :controller => "reports",
                                :action => "report_denied",
                                :as => "report_denied"

end
