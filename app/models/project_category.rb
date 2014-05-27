class ProjectCategory < ActiveRecord::Base

  has_many :projects

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
