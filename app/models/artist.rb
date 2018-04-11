class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs


  def slug
    self.name.split(" ").join("-").downcase
  end

  def self.find_by_slug(slug)
    all_artists = Artist.all
    artist = all_artists.find do |artist|
              artist.slug == slug
            end
    return artist
  end


end
