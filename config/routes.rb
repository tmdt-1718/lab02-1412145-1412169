
Rails.application.routes.draw do
  
  get 'friends/accept/:id', to: 'friends#acceptrequest'

  get 'friends/deleterequest/:id', to: 'friends#deleterequest'

  get 'friends/block/:id', to: 'friends#blockfriend'

  get 'friends/unblock/:id', to: 'friends#unblockfriend'

  get '/about', to: 'about#show'

  get '/signup', to: 'accounts#new'

  post'/signup', to: 'accounts#create'

  get '/login', to: 'sessions#new'

  post '/login', to: 'sessions#create'
  
  delete '/logout', to: 'sessions#destroy'


  # get 'messages/:id', to: 'messages#show'

  root 'home#index'

  resources :home
  resources :accounts
  resources :friends
  resources :messages
  resources :conversations

end
