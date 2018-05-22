class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_many :wikis, dependent: :destroy
  after_initialize { self.role ||= :standard }

  enum role: [:standard,:premium,:admin]

  def downgrade
    self.standard!
    self.wikis.update_all(private: false)
  end

end
