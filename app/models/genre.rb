class Genre < ActiveRecord::Base
  has_many :Artist
  has_many :Song
  has_many :song_genres
  has_many :songs, through: :song_genres
end
