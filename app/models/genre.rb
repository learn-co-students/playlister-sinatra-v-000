class Genre < ActiveRecord::Base
  has_many :songs_genres
  has_many :songs, :through => :songgenres
  has_many :artists, :through => :songs
end
