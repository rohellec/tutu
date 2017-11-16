Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    resources :railway_stations do
      patch :update_position, on: :member
    end

    resources :routes do
      member do
        get  :new_station
        post :add_station
      end
    end

    resources :tickets, only: [:new, :show, :create]

    resources :trains do
      resources :wagons, shallow: true
    end
  end

  resource :search, only: :show

  root "searches#show"
end
