Rails.application.routes.draw do
  resources :tickets
  resources :events
  resources :artists
  resources :users


  delete "/user/:id", to: "users#destroy"
  
  post '/login', to: 'auth#login'
  post '/register', to: 'auth#register'
  get '/profile', to: 'users#profile'
  
end
