class Genre < ActiveRecord::Base

  require_relative '../models/concerns/slugifiable'

  has_many :song_genres
  has_many :songs, :through => :song_genres
  has_many :artists, :through => :songs

  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods

end
