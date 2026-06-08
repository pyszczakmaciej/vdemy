Rails.application.routes.draw do
  namespace :admin do
    resources :courses do
      resources :chapters, only: [:create, :update, :destroy ] do
        resources :lessons, except: [:index]
      end
    end
    root "dashboard#index"
  end
  resource :session
  resources :passwords, param: :token
  resources :discover, only: [:index, :show]
  resources :courses, only: [:index] do
    resources :enrollments, only: [:create]
    resources :chapters, only: [] do
      resources :lessons, only: [:show]
    end
  end

  resources :payments, only: [:create] do
    collection do
      get :success
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "sign_up" => "registrations#new", as: :sign_up
  post "sign_up" => "registrations#create", as: :sign_up_create

  # Defines the root path route ("/")
  root "home#index"
end
