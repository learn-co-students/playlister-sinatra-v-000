class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, :through => :songs


  include Slugifiable::InstanceMethods    #give an error uninitialized constant
  extend Slugifiable::ClassMethods        #give an error uninitialized constant
  
end
