class Genre < ActiveRecord::Base
  has_many :artists
  has_many :song_genres  #this is used to establish the connection to the join table so all other connections can be establisded
  has_many :songs, through: :song_genres
end
