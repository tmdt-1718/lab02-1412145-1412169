
Rails.application.routes.draw do
  
  get 'friends/accept/:id', to: 'friends#acceptrequest'

  get 'friends/deleterequest/:id', to: 'friends#deleterequest'

  get 'friends/block/:id', to: 'friends#blockfriend'

  get '/about', to: 'about#show'

  # get '/albums/:album_id/photo/:id', to: 'photos#show'

  get '/signup', to: 'accounts#new'

  post'/signup', to: 'accounts#create'

  get '/login', to: 'sessions#new'

  post '/login', to: 'sessions#create'
  
  delete '/logout', to: 'sessions#destroy'


  root 'home#index'

  resources :home
  resources :accounts
  resources :friends
  resources :messages
  resources :conversations

end
