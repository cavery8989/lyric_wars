Rails.application.routes.draw do
 
 
  get '/battle', to: "battle#new"

 
  root "battle#new"
  get "/home", to: "pages#home"

  
end
