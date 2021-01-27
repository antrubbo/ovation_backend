Rails.application.routes.draw do
  resources :tickets
  resources :events
  resources :artists
  resources :users


  post '/login', to: 'users#login'
  delete "/user/:id", to: "users#destroy"
  
end
