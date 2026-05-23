class PrayerRequestsController < ApplicationController
  def index
    @public_requests = PrayerRequest.public_visible.recent.limit(20)
    @new_request = PrayerRequest.new
  end

  def new
    @prayer_request = PrayerRequest.new
  end

  def create
    @prayer_request = PrayerRequest.new(prayer_request_params)

    if @prayer_request.save
      respond_to do |format|
        format.turbo_stream {
          streams = [ turbo_stream.replace("prayer-form", partial: "prayer_requests/success") ]
          if @prayer_request.public_display?
            streams << turbo_stream.prepend("public-prayers",
              partial: "prayer_requests/prayer_card",
              locals: { prayer_request: @prayer_request })
          end
          render turbo_stream: streams
        }
        format.html { redirect_to prayer_requests_path, notice: "Your prayer request has been submitted. We are praying for you!" }
      end
    else
      respond_to do |format|
        format.turbo_stream {
          render turbo_stream: turbo_stream.replace("prayer-form",
            partial: "prayer_requests/form",
            locals: { prayer_request: @prayer_request })
        }
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

  def prayer_request_params
    params.require(:prayer_request).permit(:name, :email, :request, :anonymous, :public_display)
  end
end
