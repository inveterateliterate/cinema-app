Rails.application.routes.draw do
  
  

  resources :orders
  get "orders/new/:showing" => "orders#new", as: "new_by_showing"
  get "orders/movies/:id" => "orders#filter", as: "orders_by_movie"
  resources :showings

  root 'movies#homepage'
  


  resources :movies
  get 'movies/:title' => "movies#show", as: "movie_by_title"
  resources :auditoria
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
