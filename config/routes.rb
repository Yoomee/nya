Rails.application.routes.draw do

  ym_users_routes

  root 'home#index'

  get 'discover', to: 'projects#index', as: :discover
  resources :projects

  get 'admin', to: 'admin#index', as: :admin_to_avoid_content_pages

  resources :content_pages, path: :pages, except: :show

  get ':id', to: 'content_pages#show'

end
