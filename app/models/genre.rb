class Genre < ActiveRecord::Base
  extend Sluggable::ClassMethods
  include Sluggable::InstanceMethods
  
  has_many :songs, through: :song_genres
  has_many :song_genres
  has_many :artists, through: :songs
end