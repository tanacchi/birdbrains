Rails.application.routes.draw do
  # get 'home/top'
  get '/signin',   to: 'home#signin'
  post '/signin',  to: 'home#check_user'
  get '/signout',  to: 'home#signout'
  get '/signup',   to: 'users#new'
  get 'users/show'
  get 'users/new'
  post 'users',    to: 'users#create'
  get 'users',     to: 'users#show'
  root 'home#top'
  resources :users
end
