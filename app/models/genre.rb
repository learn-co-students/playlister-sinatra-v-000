require_relative './concerns/slugify'

class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs
  extend Slugify::ClassMethods
  include Slugify::InstanceMethods
end
