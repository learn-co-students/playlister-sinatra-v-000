class Song < ActiveRecord::Base
extend Slugify
include SlugName
  belongs_to :artist
  has_many   :song_genres
  has_many   :genres, through: :song_genres

end




#Artist-------------------------------
#   |
#   |                                |
#   |
#  Song - - - - - Song_Genres - - - Genres
                                    
