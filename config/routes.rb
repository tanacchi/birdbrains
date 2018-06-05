Rails.application.routes.draw do
  get 'home/top'
  get 'home/signin'
  get 'home/signout'
  get 'user/show'
  root 'home#top'
end
