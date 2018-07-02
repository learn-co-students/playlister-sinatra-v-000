require_relative './concerns/slugifiable'


class Genre < ActiveRecord::Base
  include Slugifiable::InstanceMethods
  extend Slugifiable::ClassMethods

  has_many :song_genres #has many song-genre relationships
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs #? Not sure about this relationship here. Does it just create an array isntance variable to hold this?
end
