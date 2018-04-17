Rails.application.routes.draw do

  root 'pages#welcome'

  get "about_us", to: "pages#about_us"

  resources :pages
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
