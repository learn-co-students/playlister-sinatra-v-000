#An Artist can have multiple songs and multiple genres
#A Genre can have multiple artists and multiple songs

class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists
end
