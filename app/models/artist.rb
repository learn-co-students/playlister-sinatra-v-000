class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :artist_genres
end