Rails.application.routes.draw do
  root 'home#index'

  get '/signup', to: 'users#new'
  get '/user/:id', to: 'users#show', as: 'user'
  get '/users', to: 'users#index'
  post '/users', to: 'users#create'

end
