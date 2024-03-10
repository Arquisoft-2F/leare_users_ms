Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  get "users/:id/enroll/:c_id" => "users#isenroll"
  get "users/:id/enroll" => "users#enroll"
  patch "courses_users/:c_id/:id" => "courses_users#modify"
  delete "courses_users/:c_id/:id" => "courses_users#remove"
  get "courses_users/:c_id/users" => "courses_users#students"
  patch "users/me" => "users#update"
  delete "users/me" => "users#destroy"

  resources :users, :courses_users 

  # Defines the root path route ("/")
  # root "posts#index"
end
