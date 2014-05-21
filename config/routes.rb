Rails.application.routes.draw do
  ym_users_routes

  get '(:path)' => "wireframes#show", :constraints => {:path => /.*/}
end
