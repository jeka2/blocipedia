class WikiPolicy < ApplicationPolicy

  attr_reader :user, :post

  def initialize(user, post)
    @user = user
    @post = post
  end

  def index?
    true
  end

end
