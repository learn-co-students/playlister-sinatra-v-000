class Genre < ActiveRecord::Base
  has_many :songs_genres
  has_many :songs, through: :songs_genres
  has_many :artist, through: :songs

  # include Slugifiable::Instance
  # extend Slugifiable::Class
end
