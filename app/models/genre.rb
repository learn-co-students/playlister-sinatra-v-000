class Genre < ActiveRecord::Base
  extend Slugify
  include SlugName
  has_many :song_genres
  has_many :artists, through: :songs
  has_many :songs, through: :song_genres


end
