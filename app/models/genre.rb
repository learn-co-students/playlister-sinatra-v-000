class Genre < ActiveRecord::Base

  #has multiple artists (through songs??)
  #has multiple songs
  has_many :artists
  has_many :song_genres
  has_many :songs, through: :song_genres

end
