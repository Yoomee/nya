class Post < ActiveRecord::Base
  include YmPosts::Post
  include YmCore::Model
end
