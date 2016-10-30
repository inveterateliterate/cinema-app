Rails.application.routes.draw do
  
  resources :orders
  get "orders/new/:showing" => "orders#new", as: "new_by_showing"
  get "orders/movies/:id" => "orders#filter", as: "orders_by_movie"
  

  root 'showings#homepage'
  get "showings/date/:date" => "showings#showdates", as: "showings_by_date"
  resources :showings

 
  resources :movies
  get 'movies/title/:title' => "movies#show_by_title", as: "movie_by_title"

  resources :auditoria
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
