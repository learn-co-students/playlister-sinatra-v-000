class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    Slugify.toSlug(self.name)
  end

  def self.find_by_slug(slug)
    self.all.select do |artist|
      artist.slug == slug
    end.first
  end
end
