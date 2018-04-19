Rails.application.routes.draw do


  #resources :pages
  resources :libraries
  resources :workers
  resources :subscribers
  resources :books
  resources :extraditions

  root 'libraries#index'
  #root 'pages#welcome'

  get "libraries/show", to: "libraries#show"

  get "workers", to: "workers#index"
  get "workers/show", to: "workers#show"

  get "subscribers", to: "subscribers#index"
  get "subscribers/show", to: "subscribers#show"

  get "books", to: "books#index"
  get "books/show", to: "books#show"

  get "extraditions", to: "extraditions#index"
  get "extraditions/show", to: "extraditions#show"
  #get "about_us", to: "pages#about_us"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
