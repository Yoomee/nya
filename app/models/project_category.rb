class ProjectCategory < ActiveRecord::Base

  has_one :forum
  has_many :projects, dependent: :restrict_with_error

  has_many :user_interests
  has_many :users, through: :user_interests

  validates :name, :slug, presence: true
  validates :slug, uniqueness: true

  before_validation :parameterize_slug

  def to_param
    slug
  end

  def to_s
    name
  end

  private
  def parameterize_slug
    self.slug = slug.parameterize
  end

end
