class Artist < ActiveRecord::Base[5.1]
  has_many :songs
  has_many :genres , through :song_genre
end