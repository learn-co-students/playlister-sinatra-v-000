class Genre < ActiveRecord::Base
  extend Slugification::ForClass
  include Slugification::ForInstance
  has_many :song_genre_binds
  has_many :songs, through: :song_genre_binds
  has_many :artists, through: :songs
end
