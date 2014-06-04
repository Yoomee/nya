class Project < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :user
  belongs_to :project_category

  has_many :project_owners, dependent: :destroy
  has_many :owners, through: :project_owners, class_name: 'User'

  has_many :project_help_offers, dependent: :destroy
  has_many :helpers, through: :project_help_offers, source: :user

  has_many :posts, :as => :target, :dependent => :destroy
  has_many :project_comments, -> { where(context: 'project_comment') }, class_name: 'Post', :as => :target, :dependent => :destroy
  has_many :project_blogs, -> { where(context: 'project_blog') }, class_name: 'Post', :as => :target, :dependent => :destroy


  acts_as_taggable

  image_accessor :image

  validates :title, :description, :user_id, :project_category_id, :help_needed, :purpose, :deadline, :city, presence: true

  geocoded_by :city_with_uk
  after_validation :geocode

  scope :community_homepage, -> { where(feature_on_community_homepage: true) }
  scope :homepage, -> { where(feature_on_homepage: true) }
  scope :recent, ->(num) { order(created_at: :desc).limit(num) }

  # will_paginate default page number
  self.per_page = 9

  def can_blog?(current_user)
    ([user] + owners).include?(current_user)
  end

  def city_with_uk
    "#{city}, UK"
  end

  def add_helper(helper)
    self.helpers << helper
  end

  private
  def should_generate_new_friendly_id?
    slug.blank? || title_changed?
  end

end
