require './lib/parse_time'

class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs
  include ParseTime::Slugger
  extend ParseTime::FindSlug
end
