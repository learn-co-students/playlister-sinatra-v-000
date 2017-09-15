class Genre < ActiveRecord::Base
  has_many :songs
  has_many :song_genres
  has_many :artists, :through => :song_genres
end
