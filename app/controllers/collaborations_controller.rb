class CollaborationsController < ApplicationController

  def create
    @wiki = Wiki.find(params[:wiki_id])
    selected_emails = params[:selected_emails]
    unless selected_emails
      flash[:notice] = "Please check at least one user"
      redirect_back(fallback_location: @wiki)
      return
    else
      selected_emails.each do |email|
        user = User.find_by(email: email)
        Collaboration.create(user: user, wiki: @wiki)
    end
 end
    flash[:notice] = "The collaboration(s) were created"
    redirect_to @wiki
  end

  def edit
    @colabs = Collaboration.all
  end

  def destroy
    @wiki = Wiki.find(params[:id])
    selected_emails = params[:selected_emails]
    unless selected_emails
      flash[:notice] = "Please check at least one user"
      redirect_back(fallback_location: @wiki)
      return
    else
      selected_emails.each do |email|
        user = User.find_by(email: email)
        colab = Collaboration.find_by(user: user.id, wiki: @wiki)
        colab.destroy
       end
    end
    flash[:notice] = "The collaboration(s) were removed"
    redirect_to @wiki
  end
end
