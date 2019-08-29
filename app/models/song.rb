class Song < ActiveRecord::Base
  extend Slugifiable::ClassMethods
  self.include Slugifiable::InstanceMethods
  # The self keyword is needed because "include" is a Sinatra keyword, too.
  
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres
end