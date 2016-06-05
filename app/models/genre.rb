class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, :through => :song_genres
  has_many :artists, :through => :songs

  extend Slugifiable::InstanceMethods
  include Slugifiable::ClassMethods
end
