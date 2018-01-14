class Genre < ActiveRecord::Base

  has_many :song_genres  #this is used to establish the connection to the join table so all other connections can be establisded
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs   #establishes connection through songs to artist
  
  include Slugable::InstanceMethods
  extend  Slugable::ClassMethods
end
