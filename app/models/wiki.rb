class Wiki < ApplicationRecord
  belongs_to :user
  after_update :initialize_wiki, except: :new
  has_many :collaborations
  has_many :users, through: :collaborations


  private
  def initialize_wiki
    self.private ||= false
  end
end
