class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    artist = self.name
    artist = artist.downcase
    artist = artist.split(" ")
    artist.join("-")
  end

end
