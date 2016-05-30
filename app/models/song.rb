require_relative "../helpers/support_modules"

class Song < ActiveRecord::Base
  include Slugs

  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

end
