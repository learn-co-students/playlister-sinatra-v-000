class Artist < ActiveRecord::Base
  has_many :songs
  has_many :artist_genres
  has_many :genres, through: :artist_genres
end