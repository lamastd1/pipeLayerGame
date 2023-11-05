Rails.application.routes.draw do
  get 'pvp_bot/index'
  get 'pvp_online/index'
  root 'home#index'
  get 'home/about'

  get 'local', to:'pvp_local#index'
  post '/process_button_click', to: 'pvp_local#process_button_click'
  post '/process_button_click_two', to: 'pvp_local#process_button_click_two'

  get 'online', to:'pvp_online#index'
  post '/process_button_click', to: 'pvp_online#process_button_click'
  post '/process_button_click_two', to: 'pvp_online#process_button_click_two'

  get 'bot', to:'pvp_bot#index'
  post '/process_button_click', to: 'pvp_bot#process_button_click'
  post '/process_button_click_two', to: 'pvp_bot#process_button_click_two'

  post '/pvp_local_action', to: 'pvp_local#process_button'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
