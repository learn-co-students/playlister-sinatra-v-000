#require 'slugifyer'

class Genre < ActiveRecord::Base  
  #extend Slugifyer::ClassMethods
  #include Slugifyer::InstanceMethods
  
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs
end