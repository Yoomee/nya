class Forum < ActiveRecord::Base

  image_accessor :image

  validates :name, presence: true


end
