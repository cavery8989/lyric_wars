Rails.application.routes.draw do
 
 
  get '/battle', to: "battle#new"
  post '/battle', to: 'battle#create'
  
  get '/battle/:id', to: 'battle#show'

 
  root "battle#new"
  get "/home", to: "pages#home"

  
end
