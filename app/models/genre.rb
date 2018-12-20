class Genre < ActiveRecord::Base
  has_many :songs_genres
  has_many :songs, through: :songs_genres
  has_many :artists_genres
  has_many :artists, through: :songs
end