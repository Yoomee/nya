class ContentPage < ActiveRecord::Base

  validates :title, :slug, presence: true
  validates :slug, uniqueness: true

  before_validation :parameterize_slug

  def to_param
    slug
  end

  private
  def parameterize_slug
    self.slug = slug.parameterize
  end
end
