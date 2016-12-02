class Genre < ActiveRecord::Base
  has_many :genre_songs
  has_many :songs, through: :genre_songs
  has_many :artists, through: :songs
end
