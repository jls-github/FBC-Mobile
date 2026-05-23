class Event < ApplicationRecord
  validates :title, presence: true
  validates :starts_at, presence: true

  scope :upcoming, -> { where("starts_at >= ?", Time.current).order(:starts_at) }
  scope :featured, -> { where(featured: true) }
  scope :this_month, -> { where(starts_at: Time.current.beginning_of_month..Time.current.end_of_month) }

  CATEGORIES = %w[general worship youth kids family outreach men women seniors].freeze

  def formatted_date
    starts_at.strftime("%A, %B %-d")
  end

  def formatted_time
    return "All Day" if all_day
    if ends_at
      "#{starts_at.strftime("%-I:%M %p")} – #{ends_at.strftime("%-I:%M %p")}"
    else
      starts_at.strftime("%-I:%M %p")
    end
  end

  def formatted_month_day
    starts_at.strftime("%b %-d")
  end

  def category_label
    category.humanize
  end
end
