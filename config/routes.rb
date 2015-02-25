Rails.application.routes.draw do
  resources :bugs

  root 'home#index'

  get	 	'/signup',			to: 'users#new'
  get		'/user/:id',		to: 'users#show',	as: 'user'
  get		'/user/:id/verify', to: 'users#verify', as: 'verify_user'
  get	 	'/users',			to: 'users#index'
  post	 	'/users',			to: 'users#create'
  get	 	'/login',			to: 'sessions#new'
  post 	 	'/login',			to: 'sessions#create'
  delete 	'/logout',			to: 'sessions#destroy'
  get		'/riot.txt',		to: 'home#riot'
  get '/bug/report',  to: 'bugs#new', as: 'bug_report'
end
