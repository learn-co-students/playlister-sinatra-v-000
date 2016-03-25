class Genre < ActiveRecord::Base
  # has_many :songs, through: :song_genres
  # has_many :artists, through: :artists_genres
  # A Genre can have multiple artists and multiple songs
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists_genres
  has_many :artists, through: :artists_genres
end
