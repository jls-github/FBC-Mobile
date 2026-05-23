class Group < ApplicationRecord
  validates :name, presence: true

  CATEGORIES = %w[small_group bible_study mens womens youth kids young_adults seniors ministry].freeze

  scope :open, -> { where(open_enrollment: true) }
  scope :by_category, ->(cat) { where(category: cat) }

  def category_label
    category.humanize.gsub("_", " ")
  end

  def spots_available
    return nil unless capacity
    capacity
  end
end
