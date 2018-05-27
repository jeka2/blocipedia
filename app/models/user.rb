class User < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_many :wikis, dependent: :destroy
  after_initialize { self.role ||= :standard }
  after_update :publish_wikis
  has_many :wiki_collaborators, through: :collaboration, source: :wiki

  enum role: [:standard,:premium,:admin]

  def self.search(term)
    where('LOWER(title) LIKE :term', term: "%#{term.downcase}%")
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
