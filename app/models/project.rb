class Project < ActiveRecord::Base
  belongs_to :user

  image_accessor :image

  validates :title, :description, :user_id, :help_needed, :purpose, :deadline, :city, presence: true

  geocoded_by :city_with_uk
  after_validation :geocode

  def city_with_uk
    "#{city}, UK"
  end

end
