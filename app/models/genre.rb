
class Genre < ActiveRecord::Base  
  extend Memorable::ClassMethods
  include Memorable::InstanceMethods
  
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs
end