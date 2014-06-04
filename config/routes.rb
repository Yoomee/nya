Rails.application.routes.draw do

  root 'home#index'

  devise_for :users, :skip => [:sessions]
  devise_scope :user do
    post 'login', to: 'devise/sessions#create', as: :user_session
    delete 'logout', :to => 'devise/sessions#destroy', :as => 'sign_out'
    get 'change-password', :to => 'devise/registrations#edit', :as => 'change_password'
    get 'reset-password', :to => 'devise/passwords#new', :as => 'reset_password'
    get 'users/password/edit', :to => 'devise/passwords#edit'
  end
  get 'sign-up' => 'registrations#new', :as => 'sign_up'
  get 'login' => 'registrations#new', :login => true, :as => 'sign_in'
  get 'login' => 'registrations#new', :login => true, :as => 'new_user_session'

  ym_users_routes(:devise => false)

  resources :users, only: [] do
    get :autocomplete_user_full_name, on: :collection, as: :autocomplete
    member do
      post 'request_help', to: 'users#request_help'
    end
  end

  resources :projects, except: :index do
    member do
      post 'offer_help', to: 'projects#offer_help'
      get :owners
    end
  end
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
