Rails.application.routes.draw do

  root 'home#index'

  resources :pages

  ym_users_routes

  get '(:path)' => "wireframes#show", :constraints => {:path => /.*/}
end
