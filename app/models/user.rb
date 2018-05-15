class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_many :wikis, dependent: :destroy
  after_initialize :set_user_default

  def set_user_default
    self.standard!
  end

  enum role: [:standard,:premium,:admin]
end
