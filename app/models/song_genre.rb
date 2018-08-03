class SongGenre < ActiveRecord::Base 
 has many :songs
 has many :genres
end