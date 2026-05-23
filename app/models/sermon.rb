class Sermon < ApplicationRecord
  belongs_to :sermon_series, optional: true

  validates :title, presence: true

  scope :recent, -> { order(preached_on: :desc, created_at: :desc) }
  scope :featured, -> { where(featured: true) }

  def youtube_embed_id
    return nil unless video_url.present?
    if video_url.include?("youtu.be/")
      video_url.split("youtu.be/").last.split("?").first
    elsif video_url.include?("youtube.com/watch")
      URI.parse(video_url).query&.split("&")&.find { |p| p.start_with?("v=") }&.split("=")&.last
    elsif video_url.include?("youtube.com/embed/")
      video_url.split("embed/").last.split("?").first
    end
  end

  def has_video?
    video_url.present?
  end

  def has_audio?
    audio_url.present?
  end

  def formatted_duration
    return nil unless duration_minutes
    h = duration_minutes / 60
    m = duration_minutes % 60
    h > 0 ? "#{h}h #{m}m" : "#{m} min"
  end
end
