class Admin::PrayerRequestsController < Admin::BaseController
  before_action :set_prayer_request, only: [:show, :update, :destroy]

  def index
    @prayer_requests = PrayerRequest.recent
    @status_filter = params[:status]
    @prayer_requests = @prayer_requests.where(status: @status_filter) if @status_filter.present?
  end

  def show; end

  def update
    @prayer_request.update(status: params[:prayer_request][:status])
    redirect_to admin_prayer_requests_path, notice: "Prayer request updated."
  end

  def destroy
    @prayer_request.destroy
    redirect_to admin_prayer_requests_path, notice: "Prayer request deleted."
  end

  private

  def set_prayer_request
    @prayer_request = PrayerRequest.find(params[:id])
  end
end
