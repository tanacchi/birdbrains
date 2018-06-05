Rails.application.routes.draw do
  get 'home/top'
  get '/signin',   to: 'home#signin'
  post '/signin',  to: 'home#check_user'
  get '/signout',  to: 'home#signout'
  get '/signup',   to: 'user#new'
  get 'user/show'
  get 'user/new'
  post 'users',    to: 'user#create'
  get 'users',     to: 'user#show'
  root 'home#top'
  resources :users
end
