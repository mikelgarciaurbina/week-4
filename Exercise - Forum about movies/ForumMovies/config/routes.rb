Rails.application.routes.draw do
  get '/', to: 'movies#index'
  post '/search', to: 'movies#search', as: 'movies_search'
  # post '/movies', to: 'movies#create'
  # get '/movies/:id', to: 'movies#show'
  get '/login', to: 'users#form', as: 'user_login'
  post '/login', to: 'users#login'

  post '/movies/:id/comments', to: 'comments#create', as: 'movie_comments'

  resources :movies, only: [:show, :create]
end
