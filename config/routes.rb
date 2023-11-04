Rails.application.routes.draw do
  root 'home#index'
  get 'home/about'
  get 'pvp', to:'pvp#index'

  post '/process_button_click', to: 'pvp#process_button_click'
  post '/process_button_click_two', to: 'pvp#process_button_click_two'


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
