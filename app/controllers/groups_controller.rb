class GroupsController < ApplicationController
  def index
    @groups = Group.all.order(:name)
    @categories = Group::CATEGORIES

    if params[:category].present? && params[:category] != "all"
      @groups = @groups.where(category: params[:category])
      @selected_category = params[:category]
    end
  end

  def show
    @group = Group.find(params[:id])
  end
end
