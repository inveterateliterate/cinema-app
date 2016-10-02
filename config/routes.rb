Rails.application.routes.draw do
  resources :orders
  resources :showings
  resources :movies
  resources :auditoria
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
