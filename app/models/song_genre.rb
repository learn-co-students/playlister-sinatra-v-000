# songgenre.rb class for managing a join table for 
# many-to-many song-genre relationship
class SongGenre < ActiveRecord::Base
	belongs_to :song
	belongs_to :genre
end