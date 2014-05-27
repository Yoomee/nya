Rails.application.routes.draw do


  ym_users_routes

  root 'home#index'

  resources :projects
  get '/discover/:slug' => 'project_categories#show', as: :project_category
  resources :project_categories, path: :discover, except: :show

  get 'admin', to: 'admin#index', as: :admin_to_avoid_content_pages

  resources :content_pages, path: :pages, except: :show
  resources :contact_enquiries, only: :create

  get ':id', to: 'content_pages#show'

end
