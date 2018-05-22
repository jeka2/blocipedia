class DowngradesController < ApplicationController
  def create
    current_user.downgrade
    redirect_to root_path, notice: "You are now a standard-tier user"
  end
end
