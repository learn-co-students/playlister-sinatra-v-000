class Genre < ActiveRecord::Base

  has_many :artist
  has_many :song_genres
  has_many :songs, through: 'song_genres'

  def slug(name)
    name.gsub(" ", "-").downcase
  end

end