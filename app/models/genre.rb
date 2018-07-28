class Genre < ActiveRecord::Base
  has_many :artists, :through => :songs
  has_many :songgenres
  has_many :songs, :through => :songgenres
end
