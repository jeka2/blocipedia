class Wiki < ApplicationRecord
  belongs_to :user
  after_update :initialize_wiki, except: :new

  private
  def initialize_wiki
    if self.user.role == "standard"
      self.private = false
    end
  end
end
