Rails.application.routes.draw do

  root to: 'home#index'

  get '/users/restaurant' => 'users#restaurant'
  get '/users/worker' => 'users#worker'
  get 'users/:id' => 'users#show'
  get '/users/:id/applications' => 'applications#index'

  resources :users, except: [:index] do
    resources :experiences, only: [:index, :new, :create]
    resources :reviews
  end

  resources :usertypes, only: [:new, :create, :destroy, :update]

  shallow do
    resources :jobs do
      resources :applications
      resources :comments
    end
  end

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/test' => 'test#test'

  get '/test_message' => 'twilio#test_message'

  post 'twilio/voice' => 'twilio#voice'


end

