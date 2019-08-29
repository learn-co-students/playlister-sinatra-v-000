class Genre < ActiveRecord::Base
  extend Slugifiable::ClassMethods
  self.include Slugifiable::InstanceMethods 
  # The self keyword is needed because "include" is a Sinatra keyword, too.

  has_many :song_genres
  has_many :songs, through: :song_genres
  
  #has_many :artist_genres
  has_many :artists, through: :songs #through: :artist_genres
  # has_many :artists
end