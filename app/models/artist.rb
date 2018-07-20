class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    artist = self.name
    artist = artist.downcase
    artist = artist.split(" ")
    artist.join("-")
  end

  def self.find_by_slug(slug)
    self.all.find do |artist|
      d_artist = artist.name.downcase
    artist_name = slug.split('-')
  artist_name = artist_name.join(" ")
      d_artist == artist_name
    end
  end


end
