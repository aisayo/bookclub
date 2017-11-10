Rails.application.routes.draw do
  root "application#homepage"
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  resources :users


  #resources :categories #nested route categories/1/books/1
    #resources :books
      #resources :review
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


end
