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
    artist_name = slug.split('-')
  artist_name = artist_name.join(" ")
    artist_name = artist_name.titleize
      artist.name == artist_name
    end
  end


end
