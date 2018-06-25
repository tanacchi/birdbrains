Rails.application.routes.draw do
  get  '/signup',   to: 'home#signup'
  post '/signup',   to: 'users#create'
  get  '/signin',   to: 'home#signin'
  post '/signin',   to: 'home#check_user'
  get  '/signout',  to: 'home#signout'
  root 'home#top'
  resource :users, format: false, shallow: true do
    resource :memos, format: false
  end
end
