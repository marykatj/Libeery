Rails.application.routes.draw do
  get 'sessions/new'
  root 'application#home'
  resources :posts
  resources :beers
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
