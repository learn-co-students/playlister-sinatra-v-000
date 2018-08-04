class Artist < ActiveRecord::Base
  has_many :genres, through: :songs
  has_many :songs

  def self.find_by_slug(name)
    new_name = Slugifiable.slug(name)
    new_name
  end
end
