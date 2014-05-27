Rails.application.routes.draw do


  ym_users_routes

  root 'home#index'

  resources :projects
  get '/discover' => 'project_categories#index', as: :project_categories
  get '/discover/:slug' => 'project_categories#show', as: :project_category
  resources :project_categories, except: [:show, :index]

  get 'admin', to: 'admin#index', as: :admin_to_avoid_content_pages

  resources :content_pages, path: :pages, except: :show
  resources :contact_enquiries, only: :create

  resources :forums, path: 'forum'

  get ':id', to: 'content_pages#show'

end
