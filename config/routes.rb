Rails.application.routes.draw do
  
  

  resources :orders
  get "orders/new/:showing" => "orders#new", as: "new_by_showing"
  resources :showings

  root 'movies#homepage'
  get 'movies/:title' => "movies#show", as: "movie_by_title"


  resources :movies
  resources :auditoria
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
