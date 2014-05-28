Rails.application.routes.draw do


  ym_users_routes

  root 'home#index'

  resources :projects, except: :index
  get '/discover' => 'project_categories#index', as: :discover
  get '/discover/:slug' => 'project_categories#show', as: :discover_project_category
  resources :project_categories

  get 'admin', to: 'admin#index', as: :admin_to_avoid_content_pages

  resources :content_pages, path: :pages, except: :show
  resources :contact_enquiries, only: :create

  resources :forums, path: 'forum' do
    get :manage, on: :collection    
  end

  get ':id', to: 'content_pages#show'

end
