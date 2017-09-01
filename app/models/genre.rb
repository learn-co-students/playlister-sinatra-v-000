class Genre < ActiveRecord::Base
  extend Concerns::Slugify
  include Concerns::Slugify

  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs
end
