class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artists, through: :songs

  include Concerns::Slugifiable
  extend  Concerns::Slugfindable
end
