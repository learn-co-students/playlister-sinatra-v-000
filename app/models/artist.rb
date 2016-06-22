class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    Slugifiable.slugify(self.name)
  end

  def self.find_by_slug(nameslug)
    self.all.detect { |i| i.slug == nameslug}
  end
end