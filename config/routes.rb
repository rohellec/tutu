Rails.application.routes.draw do
  resources :railway_stations do
    patch :update_position, on: :member
  end

  resources :routes do
    member do
      get  :new_station
      post :add_station
    end
  end

  resources :trains do
    resources :wagons, shallow: true
  end

  resources :wagons
end
