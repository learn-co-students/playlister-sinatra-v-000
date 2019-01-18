class Genre < ActiveRecord::Base
 belongs_to :artist
 has_many :song_genres
 has_many :songs, through: :song_genres
end