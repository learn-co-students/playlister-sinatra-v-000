class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres
  has_many :genres, through: :songs

  def slug
      self.name.gsub(/ /, '-').downcase
  end

  def self.find_by_slug(slug)
    artist_name = slug.gsub(/-/, ' ')
    Artist.all.each do |artist|
      if artist.name.downcase == artist_name
        @artist = artist
      end
    end
    @artist 
  end

end
