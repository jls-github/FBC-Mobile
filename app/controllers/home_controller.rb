class HomeController < ApplicationController
  def index
    @featured_sermon = Sermon.featured.recent.first || Sermon.recent.first
    @upcoming_events = Event.upcoming.limit(3)
    @announcements = Announcement.current.limit(4)
    @featured_series = SermonSeries.featured.first
  end
end
