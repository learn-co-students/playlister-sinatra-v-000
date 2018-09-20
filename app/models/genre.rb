class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, :through => :song_genres
  has_many :artists, :through => :songs

  include Slugifiable::InstanceMethods   #give an error uninitialized constant
  extend Slugifiable::ClassMethods    #give an error uninitialized constant
  
end
