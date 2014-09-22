class BlogPost < ActiveRecord::Base

  extend FriendlyId
  friendly_id :title, use: :slugged

  image_accessor :image

  validates :title, presence: true

  def to_s
    title
  end

end
