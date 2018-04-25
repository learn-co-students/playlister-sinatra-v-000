class Artist < ActiveRecord::Base

   include Slugable::InstanceMethods
   
  has_many :songs
  has_many :genres, through: :songs

end
