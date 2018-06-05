Rails.application.routes.draw do
  get 'home/top'
  get 'home/signin'
  get 'user/show'
  root 'home#top'
end
