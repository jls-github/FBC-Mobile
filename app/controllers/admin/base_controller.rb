class Admin::BaseController < ApplicationController
  before_action :require_authentication

  layout "admin"

  private

  def require_authentication
    unless authenticated?
      redirect_to new_session_path, alert: "Please sign in to access the admin area."
    end
  end
end
