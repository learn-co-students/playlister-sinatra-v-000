class Genre < ActiveRecord::Base
  include Slugifiable::Slugify
  extend Slugifiable::FindableBySlug

  has_many :song_genres
  has_many :songs, through: :song_genres

  has_many :artists, through: :songs
end
