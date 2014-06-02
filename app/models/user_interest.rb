class UserInterest < ActiveRecord::Base
  belongs_to :user
  belongs_to :project_category
end
