Rails.application.routes.draw do
  get  '/signup',   to: 'home#signup'
  post '/signup',   to: 'users#create'
  get  '/signin',   to: 'home#signin'
  post '/signin',   to: 'home#check_user'
  get  '/signout',  to: 'home#signout'
  root 'home#top'
  post 'notice/mark_as_read', to: 'notices#mark_as_read'
  resource :users, format: false, shallow: true do
    resource :memos, format: false
    resource :calendar, format: false
    resources :reminders, format: false
    resources :notices, format: false, only: [:index, :create, :destroy]
  end
end
