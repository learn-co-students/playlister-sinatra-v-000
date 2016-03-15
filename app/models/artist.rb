class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  include Slugifiable

  def slug
    Slugifiable.slug(self.name)
  end

  def self.find_by_slug(slug)
    Artist.all.detect{ |artist| Slugifiable.slug(artist.name) == slug }
  end
end