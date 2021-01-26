Rails.application.routes.draw do
  resources :tickets
  resources :events
  resources :artists
  resources :users


  post '/login', to: 'users#login'
  get "/autologin", to: "auth#autologin"
  
end
