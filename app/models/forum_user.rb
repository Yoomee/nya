class ForumUser < ActiveRecord::Base
  belongs_to :forum
  belongs_to :user
end
