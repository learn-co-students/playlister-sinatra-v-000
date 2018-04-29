class SongGenre < ActiveRecord::Base

  belongs_to :song
  belongs_to :genre

end

# has multiple songs and multiple genres
