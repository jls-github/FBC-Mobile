class SermonSeriesController < ApplicationController
  def index
    @series = SermonSeries.recent
  end

  def show
    @series = SermonSeries.find(params[:id])
    @sermons = @series.sermons.order(preached_on: :desc)
  end
end
