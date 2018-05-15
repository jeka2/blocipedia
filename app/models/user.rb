class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_many :wikis, dependent: :destroy
  after_initialize :set_user_default

  enum role: [:standard,:premium,:admin]

  private

  def set_user_default
    if current_user
      self.role ||= standard
    end
  end

end
