class Admin::EventsController < Admin::BaseController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.order(starts_at: :asc)
  end

  def show; end
  def new;  @event = Event.new(starts_at: 1.week.from_now.beginning_of_hour); end
  def edit; end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to admin_events_path, notice: "Event created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @event.update(event_params)
      redirect_to admin_events_path, notice: "Event updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @event.destroy
    redirect_to admin_events_path, notice: "Event deleted."
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :description, :starts_at, :ends_at,
      :location, :address, :image_url, :registration_url, :category,
      :featured, :all_day, :recurring)
  end
end
