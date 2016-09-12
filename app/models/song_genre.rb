class SongGenre < ActiveRecord::Base 
  belongs_to :genre
  belongs_to :song
  belongs_to :artist 
end