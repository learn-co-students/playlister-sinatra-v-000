require_relative "../helpers/support_modules"

class Genre < ActiveRecord::Base
  include Slugs

  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

end
