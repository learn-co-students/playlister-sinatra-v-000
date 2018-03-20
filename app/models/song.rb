class Song < ActiveRecord::Base
#========================modules=========================== 
  can Slugify::InstanceMethods
  can_also Slugify::ClassMethods
#========================================================== 
  belongs_to :artist
  has_many :song_genres
  has_many :genres, :through => :song_genres
#========================================================== 
end