Rails.application.routes.draw do
  get 'home/top'
  get 'user/show'
  root 'home#top'
end
