Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index" 
  root "merchant_intakes#new"
  
  resources :merchant_intakes, only: [:new, :create, :show] do
    member do
      post :run_pipeline
    end
  end

  resources :automation_runs, only: [:show]
  
  get  "/portal/login",           to: "portal_sessions#new"
  post "/portal/login",           to: "portal_sessions#create"

  get  "/portal/advertisers/new", to: "advertisers#new"
  post "/portal/advertisers",     to: "advertisers#create"
  get  "/portal/advertisers/:id", to: "advertisers#show", as: :portal_advertiser

  get  "/portal/offers/new",      to: "offers#new"
  post "/portal/offers",          to: "offers#create"
  get  "/portal/offers/:id",      to: "offers#show", as: :portal_offer
end
