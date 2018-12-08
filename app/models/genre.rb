class Genre < ActiveRecord::Base
  has_many :artists
  has_many :song_genres
  has_many :songs, through: :songs_genres
end
