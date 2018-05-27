class CollaborationsController < ApplicationController
  def create
    @wiki_id = params[:wiki_id]
    @user_id = params[:user_id]
  end

  def delete
  end
end
