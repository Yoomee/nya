class Forum < ActiveRecord::Base

  has_many :posts, :as => :target, :dependent => :destroy

  image_accessor :image

  validates :name, presence: true


end
