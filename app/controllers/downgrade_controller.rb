class DowngradeController < ApplicationController
  def create
    current_user.wikis.where(private: true).each do |wiki|
      wiki.update_attributes(:private => false)
    end
    current_user.standard!
    redirect_to root_path, notice: "You are now a standard-tier user"
  end
end
