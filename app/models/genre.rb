class Genre < ActiveRecord::Base

  has_many :artist
  has_many :song_genres
  has_many :songs, through: 'song_genres'

  def slug
    name.gsub(" ", "-").downcase
  end

  def self.find_by_slug(slug)
    Genre.all.find do |artist|
      artist.slug == slug
    end 
  end

end
