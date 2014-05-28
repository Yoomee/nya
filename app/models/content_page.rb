class ContentPage < ActiveRecord::Base

  extend FriendlyId
  friendly_id :url, use: :slugged

  validates :link_text, :url, :title, presence: true

  after_validation :move_friendly_id_error_to_url

  def to_s
    title
  end

  private
  def move_friendly_id_error_to_url
    errors.add :url, *errors.delete(:friendly_id) if errors[:friendly_id].present?
  end

  def should_generate_new_friendly_id?
    slug.blank? || url_changed?
  end

end
