class Genre < ActiveRecord::Base
  require_relative './concerns/slugifiable'
  include Slugifiable
  extend Findable

  has_many :songs, through: :song_genres
  has_many :song_genres
  has_many :artists, through: :songs
end
