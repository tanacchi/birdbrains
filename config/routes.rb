Rails.application.routes.draw do
  # resources :users
  get 'home/top'
  get 'home/signin'
  get 'home/signout'
  get 'user/show'
  root 'home#top'
end
