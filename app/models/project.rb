class Project < ActiveRecord::Base
  belongs_to :user
  belongs_to :project_category

  has_many :posts, :as => :target, :dependent => :destroy
  has_many :project_comments, -> { where(context: 'project_comment') }, class_name: 'Post', :as => :target, :dependent => :destroy
  has_many :project_blogs, -> { where(context: 'project_blog') }, class_name: 'Post', :as => :target, :dependent => :destroy


  acts_as_taggable

  image_accessor :image

  validates :title, :description, :user_id, :project_category_id, :help_needed, :purpose, :deadline, :city, presence: true

  geocoded_by :city_with_uk
  after_validation :geocode

  scope :homepage, -> { where(feature_on_homepage: true) }
  scope :recent, -> { order(created_at: :desc).limit(3) }

  # will_paginate default page number
  self.per_page = 9

  def city_with_uk
    "#{city}, UK"
  end

  def to_param
    "#{id} #{title}".parameterize
  end

end
