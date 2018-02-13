class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    Slugifiable.slugify(self.name)
  end

  def self.find_by_slug(slug)
    Artist.where("LOWER(name) = ?", Slugifiable.unslugify(slug)).first
  end

end
