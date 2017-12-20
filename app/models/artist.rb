class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs
  has_many :song_genres
end
