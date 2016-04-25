Rails.application.routes.draw do
  get "/", to: "site#home"
  get "/text_inspections/new", to: "text_inspections#new"
  post "/text_inspections", to: "text_inspections#create"
  get "/asciis/new", to: "asciis#new"
  post "/asciis", to: "asciis#create"
  get "/lorem/new", to: "lorem#new"
  post "/lorem", to: "lorem#create"
end
