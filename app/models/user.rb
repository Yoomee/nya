class User < ActiveRecord::Base
  extend FriendlyId
  friendly_id :full_name, use: :slugged

  include YmCore::Model
  include YmUsers::User

  has_many :created_projects, class_name: 'Project'
  has_many :project_owners, foreign_key: :owner_id
  has_many :owned_projects, through: :project_owners, source: :project
  has_many :user_interests, dependent: :destroy
  has_many :interests, -> { uniq }, through: :user_interests, source: :project_category, class_name: 'ProjectCategory'

  has_many :project_help_offers, dependent: :destroy
  has_many :projects_helping, through: :project_help_offers, source: :project

  validates :first_name, :last_name, presence: true
  validates :email, email: true, presence: true, uniqueness: true
  validates :website, url: true
  validates_presence_of :password, on: :create

  acts_as_taggable

  geocoded_by :city_with_uk
  after_validation :geocode

  accepts_nested_attributes_for :interests

  scope :recent, -> { order(created_at: :desc).limit(3) }

  def city_with_uk
    return '' unless city?
    "#{city}, UK"
  end

  def projects
    created_projects + owned_projects
  end

  private
  def should_generate_new_friendly_id?
    slug.blank? || first_name_changed? || last_name_changed?
  end

end
