class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_many :wikis, dependent: :destroy
  after_initialize { self.role ||= :standard }
  after_update :publish_wikis

  enum role: [:standard,:premium,:admin]

  private
  def publish_wikis
    if self.standard?
      self.wikis.each do |wiki|
        wiki.update_attributes(private: false)
      end
    end
  end

end
