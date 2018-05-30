class Wiki < ApplicationRecord
  belongs_to :user
  has_many :collaborations
  has_many :users, through: :collaborations

  after_update :initialize_wiki, except: :new

  validates :title, length: { minimum: 5 }, presence: true
  validates :body, length: { minimum: 20 }, presence: true
  validates :user, presence: true



  private
  def initialize_wiki
    self.private ||= false
  end
end
