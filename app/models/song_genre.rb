class SongGenre < ActiveRecord::Base
  belongs_to :song
  belongs_to :genre
 #need to setup the many to many relationship between songs and genres
end
