class Song < ActiveRecord::Base

  belongs_to :artist
  has_many :song_genres  # this is a table I must build out.  
  has_many :genres, through: 'song_genres'

end
