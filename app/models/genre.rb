require_relative './concerns/slugifiable'
class Genre < ActiveRecord::Base

  include Slugifiable::InstanceMethods
  extend Slugifiable::ClassMethods
  has_many :artists, through: :songs
  has_many :songs, through: :song_genres
  has_many :song_genres
end