class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  has_many :wikis, dependent: :destroy
  has_many :wiki_collaborators, through: :collaboration, source: :wiki

  after_initialize { self.role ||= :standard }
  after_update :publish_wikis

  validates :encrypted_password, presence: true, length: { minimum: 6 }
  validates :email,
             presence: true,
             uniqueness: { case_sensitive: false },
             length: { minimum: 3, maximum: 254 }

  enum role: [:standard,:premium,:admin]

  def self.search(term)
    where('LOWER(title) LIKE :term', term: "%#{term.downcase}%")
  end

  def downgrade
    self.standard!
  end

  private
  def publish_wikis
    if self.standard?
      self.wikis.each do |wiki|
        wiki.update_attributes(private: false)
      end
    end
  end

end
