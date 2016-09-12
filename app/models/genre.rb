require './lib/parse_time'

class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs
  include ParseTime::Slugger
  extend ParseTime::FindSlug
end
