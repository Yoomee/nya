Rails.application.routes.draw do

  root 'home#index'

  ym_users_routes

  get ':id', to: 'content_pages#show'
end
