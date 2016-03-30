class Genre < ActiveRecord::Base
  include SlugInstance
  extend SlugClass
  
  has_many :artists, through: :songs
  has_many :song_genres
  has_many :songs, through: :song_genres
end