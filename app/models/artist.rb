require_relative "./concerns/slugifiable.rb"

class Artist < ActiveRecord::Base
  extend Slugifiable::ClassMethods
  self.include Slugifiable::InstanceMethods 
  # The self keyword is needed because "include" is a Sinatra keyword, too.
  
  has_many :songs
  #has_many :artist_genres
  has_many :genres, through: :songs #through: :artist_genres
  # has_many :genres
end