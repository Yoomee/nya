class Project < ActiveRecord::Base
  belongs_to :user

  image_accessor :image

  validates :title, :description, :user_id, :help_needed, :purpose, :deadline, :city, presence: true

end
