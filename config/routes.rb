Rails.application.routes.draw do


  resources :pages
  
  root 'pages#welcome'

  get "about_us", to: "pages#about_us"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
