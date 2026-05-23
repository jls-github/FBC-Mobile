class Admin::SermonSeriesController < Admin::BaseController
  before_action :set_series, only: [:show, :edit, :update, :destroy]

  def index
    @series = SermonSeries.recent
  end

  def show; end
  def new;  @series = SermonSeries.new; end
  def edit; end

  def create
    @series = SermonSeries.new(series_params)
    if @series.save
      redirect_to admin_sermon_series_index_path, notice: "Series created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @series.update(series_params)
      redirect_to admin_sermon_series_index_path, notice: "Series updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @series.destroy
    redirect_to admin_sermon_series_index_path, notice: "Series deleted."
  end

  private

  def set_series
    @series = SermonSeries.find(params[:id])
  end

  def series_params
    params.require(:sermon_series).permit(:name, :description, :image_url, :year, :featured, :position)
  end
end
