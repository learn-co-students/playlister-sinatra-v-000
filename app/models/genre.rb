class Genre < ActiveRecord::Base
  require_relative '../../lib/slug_methods.rb'
  has_many :song_genres
  has_many :artists, through: :song_genres, source: :song
  has_many :songs, through: :song_genres

  extend SlugMethods::ClassMethods
  include SlugMethods::InstanceMethods

end
