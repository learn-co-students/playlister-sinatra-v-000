class Artist < ActiveRecord::Base
  has_many :songs
  # An Artist can have multiple songs and multiple genres
  has_many :artists_genres
  has_many :genres, through: :artists_genres
end
