class User < ActiveRecord::Base
  extend FriendlyId
  friendly_id :full_name, use: :slugged

  include YmUsers::User

  has_many :projects

  validates_presence_of :first_name, :last_name
  validates :email, :email => true, :presence => true, :uniqueness => true
  validates_presence_of :password, :on => :create

  geocoded_by :city_with_uk
  after_validation :geocode

  def city_with_uk
    return '' unless city?
    "#{city}, UK"
  end

  private
  def should_generate_new_friendly_id?
    slug.blank? || first_name_changed? || last_name_changed?
  end

end
