module ApplicationHelper
  def curr_user(user)
    @curr_id = user.id
  end

  def current_user_id
    @curr_id
  end
end
