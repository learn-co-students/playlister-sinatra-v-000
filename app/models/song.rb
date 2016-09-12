require './lib/parse_time'

class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres
  include ParseTime::Slugger
  extend ParseTime::FindSlug
end
