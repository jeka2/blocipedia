class DowngradeController < ApplicationController
  def create
    current_user.standard!
  end
end
