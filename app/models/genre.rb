require_relative '../helper_methods/support_modules'

class Genre < ActiveRecord::Base
  include Slugs
  
  has_many :artists, through: :songs
  has_many :song_genres
  has_many :songs, through: :song_genres
end