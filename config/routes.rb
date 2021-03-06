Rails.application.routes.draw do
  root 'application#home'
  resources :posts, only: [:index, :new, :create, :show]
  resources :beers, only: [:index, :new, :create, :show]   #update/edit
  resources :users, except: [:index, :destroy]
  resources :favorites, only: [:create, :destroy]

  get 'beer/filter', to: 'beers#filter'
  get 'beer/filter/results', to: 'beers#filter_results'
  get '/index/full', to: 'beers#full_list', as: 'full_list'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/login', to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
