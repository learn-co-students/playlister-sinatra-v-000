class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    self.name.parameterize
  end

  def self.find_by_slug(slug)
    artist_name = slug.titleize
    self.all.detect{|artist| artist.name == artist_name}
  end
end
