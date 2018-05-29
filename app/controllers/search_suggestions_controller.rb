class SearchSuggestionsController < ApplicationController
  def new
    current_collaborator_emails = []
    current_collaborator_emails << current_user.email
    @wiki_id = params[:wiki_id]
    @q = "%#{params[:query]}%"
    unless Collaboration.all.count == 0
      Collaboration.all.each do |user|
        current_collaborator_emails << User.find_by(id: user[:user_id]).email
      end
    end
    current_collaborator_emails.uniq!
    @user = User.where("email LIKE ?", @q).where.not(email: current_collaborator_emails)
  end
end
