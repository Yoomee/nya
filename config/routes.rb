Rails.application.routes.draw do

  ym_users_routes

  root 'home#index'

  resources :projects, :path => "/discover", only: :index
  resources :projects, except: :index

  get 'admin', to: 'admin#index', as: :admin_to_avoid_content_pages

  get ':id', to: 'content_pages#show'

end
