Rails.application.routes.draw do
  resources :patients
  devise_for :users, controllers: { registrations: 'custom_registrations' }
  namespace :admin do
    resources :users, only: [:index, :show, :edit, :update]
  end
  root "home#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
