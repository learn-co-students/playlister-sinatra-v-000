class Song < ActiveRecord::Base
  has_many :song_genres
  has_many :genres, through: :song_genres
  belongs_to :artist


  def slug
    song = self.name
    song = song.downcase
    song = song.split(" ")
    song.join("-")
  end

  def self.find_by_slug(slug)
    
  end
end
