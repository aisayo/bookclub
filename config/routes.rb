Rails.application.routes.draw do
  root "application#homepage"
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'

  resources :users, only: [:show, :delete] do
    #resources :books do
      resources :reviews
    #end
  end

  resources :books do
    resources :reviews
  end

get '/auth/facebook/callback' => 'sessions#oauth'

end
