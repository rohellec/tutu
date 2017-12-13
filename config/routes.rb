Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: "sessions" }

  namespace :admin do
    resources :railway_stations do
      patch :update_position, on: :member
    end

    resources :routes do
      member do
        get    :new_station
        post   :add_station
        delete "delete_station/:station_id", to: "routes#delete_station",
                                             as: :delete_station
      end
    end

    resources :tickets

    resources :trains do
      resources :wagons, shallow: true, except: :index
    end
  end

  resource :search, only: :show
  resources :tickets, except: [:edit, :update]

  get :admin, to: "admin/base#index", as: :admin

  root "searches#show"
end
