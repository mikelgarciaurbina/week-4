Rails.application.routes.draw do
  get '/', to: 'site#home'
  get '/contact', to: 'site#contact'
  get '/say_name/:name', to: 'site#say_name'
  get '/calculator', to: 'site#calculator'
  post '/calculate', to: 'site#calculate'

  get '/projects', to: 'projects#index'
  get '/projects/new', to: 'projects#new'
  get '/projects/:id', to: 'projects#show'
  post '/projects', to: 'projects#create'

  get '/projects/:project_id/time_entries', to: 'time_entries#index'
end
