class Song < ActiveRecord::Base

  belongs_to :artist
  has_many :songsgenres
  has_many :genres, :through => :songsgenres

end
