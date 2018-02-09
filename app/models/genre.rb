class Genre < ActiveRecord::Base
  include Slugify::Instances
  extend Slugify::Classes

  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs
end
