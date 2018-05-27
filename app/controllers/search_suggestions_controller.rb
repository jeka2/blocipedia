class SearchSuggestionsController < ApplicationController
  def index
    @q = "%#{params[:query]}%"
    @user = User.where("email LIKE ?", @q)
  end
end
