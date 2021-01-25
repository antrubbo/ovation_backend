Rails.application.routes.draw do
  resources :tickets
  resources :events
  resources :artists
  resources :users

  get "/autologin", to: "auth#autologin"
  
end
