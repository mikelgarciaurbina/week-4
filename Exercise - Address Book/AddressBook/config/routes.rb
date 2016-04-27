Rails.application.routes.draw do
  # get '/contacts', to: 'contacts#index'
  # get '/contacts/new', to: 'contacts#new'
  # post("/contacts", :to => "contacts#create")
  root to: 'contacts#index'
  
  post "/contacts/create_favorite", to: "contacts#favorite"
  post "/contacts/name", to: "contacts#search_name"
  get "/contacts/search", to: "contacts#search"

  resources :contacts, only: [:index,:new,:create,:show]
end
