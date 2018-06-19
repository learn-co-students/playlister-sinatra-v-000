class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def slug
    self.name.downcase.gsub(" ", "-")
  end

  def self.find_by_slug(artist)
    @artist_name = artist.split("-").map {|word| word.capitalize}.join(" ")
    @artist = Artist.find_by(name: @artist_name)
  end

end
