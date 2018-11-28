class Genre < ActiveRecord::Base

  has_many :songsgenres
  has_many :songs, :through => :songsgenres
  has_many :artists, :through => :songs
end
