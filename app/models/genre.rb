class Genre < ActiveRecord::Base

  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods

  # A Genre can have multiple artists and multiple songs
  has_many :artists, :through => :songs
  has_many :songs, :through => :song_genres
  has_many :song_genres

end
