class SongGenre < ActiveRecord::Base
  belongs_to :songs
  belongs_to :genres
 #need to setup the many to many relationship between songs and genres
end
