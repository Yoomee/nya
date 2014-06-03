class ProjectOwner < ActiveRecord::Base
  belongs_to :project
  belongs_to :owner, class_name: 'User'
end
