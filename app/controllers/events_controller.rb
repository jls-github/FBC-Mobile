class EventsController < ApplicationController
  def index
    @upcoming_events = Event.upcoming.limit(20)
    @categories = Event::CATEGORIES

    if params[:category].present? && params[:category] != "all"
      @upcoming_events = @upcoming_events.where(category: params[:category])
      @selected_category = params[:category]
    end
  end

  def show
    @event = Event.find(params[:id])
  end
end
