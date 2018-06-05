Rails.application.routes.draw do
  resources :users
  get 'home/top'
  get 'home/signin'
  get 'home/signout'
  get 'home/signup'
  get 'user/show'
  get 'user/new'
  root 'home#top'
end
