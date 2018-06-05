Rails.application.routes.draw do
  get 'home/top'
  get 'home/signin'
  get 'home/signout'
  get 'home/signup'
  get 'user/show'
  get 'user/new'
  post 'users/' => 'user#create'
  root 'home#top'
  resources :users
end
