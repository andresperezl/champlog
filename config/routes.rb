Rails.application.routes.draw do
  root 'home#index'

  get	 	'/signup',			to: 'users#new'
  get		'/user/:id',		to: 'users#show',	as: 'user'
  get		'/user/:id/verify', to: 'users#verify', as: 'verify_user'
  get	 	'/users',			to: 'users#index'
  post	 	'/users',			to: 'users#create'
  get	 	'/login',			to: 'sessions#new'
  post 	 	'/login',			to: 'sessions#create'
  delete 	'/logout',			to: 'sessions#destroy'
end
