class Genre < ActiveRecord::Base
  include Slugifiable::Instance
  extend Slugifiable::Class

  has_many :artists, through: :songs
  has_many :song_genres
  has_many :songs, through: :song_genres

end