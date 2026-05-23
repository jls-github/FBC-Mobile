class SermonsController < ApplicationController
  def index
    @sermons = Sermon.recent.includes(:sermon_series)
    @series_list = SermonSeries.recent

    if params[:series_id].present?
      @selected_series = SermonSeries.find(params[:series_id])
      @sermons = @sermons.where(sermon_series: @selected_series)
    end

    @sermons = @sermons.page(params[:page]).per(10)
  end

  def show
    @sermon = Sermon.find(params[:id])
    @related_sermons = if @sermon.sermon_series
      @sermon.sermon_series.sermons.where.not(id: @sermon.id).order(preached_on: :desc).limit(3)
    else
      Sermon.recent.where.not(id: @sermon.id).limit(3)
    end
  end
end
