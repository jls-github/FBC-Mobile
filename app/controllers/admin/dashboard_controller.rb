class Admin::DashboardController < Admin::BaseController
  def index
    @stats = {
      sermons:       Sermon.count,
      sermon_series: SermonSeries.count,
      events:        Event.upcoming.count,
      groups:        Group.count,
      announcements: Announcement.current.count,
      prayer_requests: PrayerRequest.where(status: "new").count
    }
    @recent_prayers   = PrayerRequest.recent.limit(5)
    @upcoming_events  = Event.upcoming.limit(5)
    @recent_sermons   = Sermon.recent.limit(5)
  end
end
