class Artist < ActiveRecord::Base
  has_many :songs 
  has_many :artists_genres
  has_many :genres, through: :songs
end