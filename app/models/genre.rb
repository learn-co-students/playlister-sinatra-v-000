class Genre < ActiveRecord::Base
  has_many :artists
  has_many :genre_songs
  has_many :songs, through: :genres_songs
end