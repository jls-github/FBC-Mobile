class SermonSeries < ApplicationRecord
  has_many :sermons, dependent: :destroy

  validates :name, presence: true

  scope :featured, -> { where(featured: true) }
  scope :recent, -> { order(year: :desc, created_at: :desc) }

  def sermon_count
    sermons.count
  end

  def latest_sermon
    sermons.order(preached_on: :desc).first
  end
end
