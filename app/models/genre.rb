class Genre < ActiveRecord::Base
  extend Slugifiable::ClassMethods
  self.include Slugifiable::InstanceMethods 
  
  has_many :song_genres
  has_many :songs, through: :song_genres
  
  #has_many :artist_genres
  has_many :artists, through: :songs #through: :artist_genres
  # has_many :artists
end