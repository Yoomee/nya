class Project < ActiveRecord::Base
  belongs_to :user
  belongs_to :project_category

  acts_as_taggable

  image_accessor :image

  validates :title, :description, :user_id, :project_category_id, :help_needed, :purpose, :deadline, :city, presence: true

  geocoded_by :city_with_uk
  after_validation :geocode

  # will_paginate default page number
  self.per_page = 9

  def city_with_uk
    "#{city}, UK"
  end

  def to_param
    "#{id} #{title}".parameterize
  end

end
