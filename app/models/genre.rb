class Genre < ActiveRecord::Base
  has_many :song_genres
  has_many :songs, through: :song_genres
  has_many :artist, through: :songs

  include Slugifiable::Instance
  extend Slugifiable::Class
end
