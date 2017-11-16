class Genre < ActiveRecord::Base
  has_many :song_genres
  has many :songs, :though => :song_genres
  has many :artists, :through => :songs

end
