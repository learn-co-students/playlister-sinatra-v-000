class SongGenre < ActiveRecord::Base

#confused
song
  has_many :genres
  has_many :genres, through: :artists

genre
  has_many :songs
  has_many :songs, through: :artists
end
