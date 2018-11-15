class Genre < ActiveRecord::Base
  has_many :songs, through: :song_genres
  has_many :artists, through: :artist_genres
end