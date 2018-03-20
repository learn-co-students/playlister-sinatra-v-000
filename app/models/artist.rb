class Artist < ActiveRecord::Base
#========================modules=========================== 
  can Slugify::InstanceMethods
  can_also Slugify::ClassMethods
#========================================================== 
  has_many :songs
  has_many :genres, :through => :songs
#========================================================== 
end