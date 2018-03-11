class Genre < ActiveRecord::Base
  require_relative '../../lib/slug_methods.rb'
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs


  extend SlugMethods::ClassMethods
  include SlugMethods::InstanceMethods

end
