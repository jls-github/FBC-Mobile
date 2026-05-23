class PrayerRequest < ApplicationRecord
  validates :request, presence: true
  validates :name, presence: true, unless: :anonymous?

  STATUSES = %w[new praying answered].freeze

  scope :public_visible, -> { where(public_display: true, status: %w[new praying]) }
  scope :recent, -> { order(created_at: :desc) }

  def display_name
    anonymous? ? "Anonymous" : name
  end
end
