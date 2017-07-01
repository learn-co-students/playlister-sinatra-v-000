class Genre < ActiveRecord::Base
  include Slugifable
  has_many :song_genres
  has_many :artists, through: :songs
  has_many :songs, through: :song_genres
end
