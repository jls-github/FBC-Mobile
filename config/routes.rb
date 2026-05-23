Rails.application.routes.draw do
  root "home#index"

  resources :sermons, only: [:index, :show]
  resources :sermon_series, only: [:index, :show]
  resources :events, only: [:index, :show]
  resources :groups, only: [:index, :show]
  resources :prayer_requests, only: [:index, :new, :create]

  get "give", to: "pages#give", as: :give
  get "about", to: "pages#about", as: :about
  get "contact", to: "pages#contact", as: :contact

  # PWA
  get "manifest", to: "pwa#manifest", as: :pwa_manifest
  get "service-worker", to: "pwa#service_worker", as: :pwa_service_worker

  # Health check
  get "up" => "rails/health#show", as: :rails_health_check
end
