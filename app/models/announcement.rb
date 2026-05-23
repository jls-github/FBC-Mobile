class Announcement < ApplicationRecord
  validates :title, presence: true

  scope :current, -> {
    where("published_at <= ? AND (expires_at IS NULL OR expires_at > ?)", Time.current, Time.current)
      .order(featured: :desc, position: :asc, published_at: :desc)
  }
  scope :featured, -> { where(featured: true) }

  def published?
    published_at.present? && published_at <= Time.current
  end
end
