Rails.application.routes.draw do
  root "application#homepage"
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  get 'reviews/recent_reviews', to: 'reviews#recent_reviews'
  get 'popular_books', to: 'reviews#popular_books'

  resources :users, only: [:show, :delete] do
      resources :reviews
  end

  resources :books do
    resources :reviews
  end

get '/auth/facebook/callback' => 'sessions#oauth'

end
