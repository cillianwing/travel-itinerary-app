Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do
    resources :trips
  end

  resources :trips do
    resources :flights
    resources :activities
    resources :accommodations
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  root 'sessions#new'
  get '/auth/:provider/callback', to: 'sessions#create'

end
