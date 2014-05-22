Rails.application.routes.draw do

  root 'home#index'

  resources :pages

  resources :projects, :path => "/discover", only: :index
  resources :projects, except: :index

  ym_users_routes

  get '(:path)' => "wireframes#show", :constraints => {:path => /.*/}
end
