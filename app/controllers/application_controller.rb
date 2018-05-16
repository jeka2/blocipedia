class ApplicationController < ActionController::Base
  include ApplicationHelper
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  after_action :set_user
  include Pundit

  private
  def set_user
    curr_user(current_user)
  end
end
