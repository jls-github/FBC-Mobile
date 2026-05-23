class Admin::GroupsController < Admin::BaseController
  before_action :set_group, only: [:show, :edit, :update, :destroy]

  def index
    @groups = Group.order(:name)
  end

  def show; end
  def new;  @group = Group.new; end
  def edit; end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to admin_groups_path, notice: "Group created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @group.update(group_params)
      redirect_to admin_groups_path, notice: "Group updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @group.destroy
    redirect_to admin_groups_path, notice: "Group deleted."
  end

  private

  def set_group
    @group = Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:name, :description, :leader_name, :leader_email,
      :meeting_schedule, :location, :image_url, :category, :open_enrollment, :capacity)
  end
end
