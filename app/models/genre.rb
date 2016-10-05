require_relative '../../lib/slugify.rb'

class Genre < ActiveRecord::Base
  extend Slugify::ClassMethods
  include Slugify::InstanceMethods

  has_many :artists, :through => :songs
  has_many :song_genres
  has_many :songs, :through => :song_genres

end
