class Genre < ActiveRecord::Base
  has_many :artitsts
  has_many :songs, :through => :song_genres
  has_many :artists, :through => :songs
end
