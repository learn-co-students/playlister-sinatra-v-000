class Artist < ActiveRecord::Base

  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods

  has_many :songs
  has_many :song_genres
  has_many :genres, :through => :songs
end
