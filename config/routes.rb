Rails.application.routes.draw do
  get 'pvp_bot/index'
  get 'pvp_online/index'
  # get 'pvp_online/server'
  root 'home#index'
  get 'home/about'

  get 'local', to:'pvp_local#index'
  post '/process_button_click', to: 'pvp_local#process_button_click'
  post '/process_button_click_two', to: 'pvp_local#process_button_click_two'

  get 'online', to:'pvp_online#index'
  post '/process_button_click', to: 'pvp_online#process_button_click'
  post '/process_button_click_two', to: 'pvp_online#process_button_click_two'
  post 'pvp_online/start_socket', to: 'pvp_online#start_socket', as: 'start_socket'

  resources :pvp_servers
  get 'server', to:'pvp_server#index'
  post '/process_button_click', to: 'pvp_server#process_button_click'
  post '/process_button_click_two', to: 'pvp_server#process_button_click_two'
  post 'pvp_server/start_server', to: 'pvp_server#start_server', as: 'start_socket_server'

  # root 'pvp_servers#index'
 

  get 'bot', to:'pvp_bot#index'
  post '/process_button_click', to: 'pvp_bot#process_button_click'
  post '/process_button_click_two', to: 'pvp_bot#process_button_click_two'

  resources :pvp_clients
  get 'client', to:'pvp_client#index'
  post 'pvp_client/send_message', to: 'pvp_client#send_message'

  post '/pvp_local_action', to: 'pvp_local#process_button'

  post '/action', to: 'pvp_local#action'

  # resources :pvp_local, only: [:new, :create, :show, :update]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # mount ActionCable.server, at: '/cable'

  # Defines the root path route ("/")
  # root "posts#index"
end
