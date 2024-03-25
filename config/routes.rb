Rails.application.routes.draw do
  resources :patients
  devise_for :users, skip: [:registrations]
  # as :user do
  #   get 'users/sign_up', to: 'custom_registrations#new', as: :new_user_registration
  #   post 'users', to: 'custom_registrations#create', as: :user_registration
  # end
  namespace :admin do
    resources :users, only: [:index, :new, :create, :show, :edit, :update]
  end
  root "home#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
