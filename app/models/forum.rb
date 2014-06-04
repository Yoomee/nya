class Forum < ActiveRecord::Base

  extend FriendlyId
  friendly_id :name, use: :slugged

  belongs_to :project_category
  has_many :users, through: :project_category

  has_many :posts, :as => :target, :dependent => :destroy

  image_accessor :image

  validates :name, presence: true

  after_validation :move_friendly_id_error_to_name

  private
  def move_friendly_id_error_to_name
    errors.add :name, *errors.delete(:friendly_id) if errors[:friendly_id].present?
  end

  def should_generate_new_friendly_id?
    slug.blank? || name_changed?
  end

end
