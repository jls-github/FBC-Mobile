class Admin::AnnouncementsController < Admin::BaseController
  before_action :set_announcement, only: [:show, :edit, :update, :destroy]

  def index
    @announcements = Announcement.order(position: :asc, published_at: :desc)
  end

  def show; end
  def new;  @announcement = Announcement.new(published_at: Time.current); end
  def edit; end

  def create
    @announcement = Announcement.new(announcement_params)
    if @announcement.save
      redirect_to admin_announcements_path, notice: "Announcement created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @announcement.update(announcement_params)
      redirect_to admin_announcements_path, notice: "Announcement updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @announcement.destroy
    redirect_to admin_announcements_path, notice: "Announcement deleted."
  end

  private

  def set_announcement
    @announcement = Announcement.find(params[:id])
  end

  def announcement_params
    params.require(:announcement).permit(:title, :content, :image_url, :link_url,
      :link_label, :published_at, :expires_at, :featured, :position)
  end
end
