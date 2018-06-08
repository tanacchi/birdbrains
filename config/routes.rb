Rails.application.routes.draw do
  get  '/signup',   to: 'home#signup'
  post '/signup',   to: 'users#create'
  get  '/signin',   to: 'home#signin'
  post '/signin',   to: 'home#check_user'
  get  '/signout',  to: 'home#signout'
  get  'users',     to: 'users#show'
  get  'memos',     to: 'memos#show'
  root 'home#top'
  resources :users
end
