require_relative '../models/concerns/slugifiable'

class Genre < ActiveRecord::Base
  
  extend Concerns::ClassMethods
  include Concerns::Slugifiable
  
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs
end