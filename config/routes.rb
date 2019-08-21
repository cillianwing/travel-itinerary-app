Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users do
    resources :trips
  end

  resources :trips do
    resources :flights
    resources :activities
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  root 'welcome#home'
  get '/auth/:provider/callback', to: 'sessions#create'

end
