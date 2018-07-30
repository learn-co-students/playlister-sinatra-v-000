class SongGenre < ActiveRecord::Base
  belongs_to :genre
  belongs_to :song

  # the belongs_to table is *just* holding the id 

end # SongGenre
