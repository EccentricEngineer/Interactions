Rails.application.routes.draw do
  resources :channelusers, only: [:destroy]
  get 'errors/not_found'
  get 'errors/internal_server_error'
  devise_for :users
  root to: 'channels#index'
  get '/success', to: 'authorizations#success'
  get '/code', to: 'authorizations#code'

  match "/404", to: "errors#not_found", via: :all
  match "/500", to: "errors#internal_server_error", via: :all

  post '/channels/:id/join', to: 'channels#join', as: 'channel_join'

  resources :channels do
    resources :messages, only: [:index, :create, :destroy]
    resources :feeds
    resources :rewards, only: [:create, :destroy]
  end


  resources :posts, only: [:show]

  resources :coins, only: [:update]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
