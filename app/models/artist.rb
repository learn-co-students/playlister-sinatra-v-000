class Artist < ActiveRecord::Base
  has_many :song_genres
  has_many :genres, through: :song_genres
  has_many :songs, through: :song_genres
end
