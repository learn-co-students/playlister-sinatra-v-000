class Genre < ActiveRecord::Base
#========================modules=========================== 
  can Slugify::InstanceMethods
  can_also Slugify::ClassMethods
#========================================================== 
  has_many :song_genres
  has_many :songs, :through => :song_genres
  has_many :artists, :through => :songs
#========================================================== 
end