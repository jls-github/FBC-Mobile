class Admin::SermonsController < Admin::BaseController
  before_action :set_sermon, only: [:show, :edit, :update, :destroy]

  def index
    @sermons = Sermon.includes(:sermon_series).recent
  end

  def show; end

  def new
    @sermon = Sermon.new
  end

  def edit; end

  def create
    @sermon = Sermon.new(sermon_params)
    if @sermon.save
      redirect_to admin_sermons_path, notice: "Sermon created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @sermon.update(sermon_params)
      redirect_to admin_sermons_path, notice: "Sermon updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @sermon.destroy
    redirect_to admin_sermons_path, notice: "Sermon deleted."
  end

  private

  def set_sermon
    @sermon = Sermon.find(params[:id])
  end

  def sermon_params
    params.require(:sermon).permit(:title, :description, :speaker, :preached_on,
      :video_url, :audio_url, :thumbnail_url, :duration_minutes,
      :sermon_series_id, :featured, :scripture_reference)
  end
end
