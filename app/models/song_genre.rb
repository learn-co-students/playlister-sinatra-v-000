class SongGenre < ActiveRecord::Base
  # "many-to-many" relationship -- join table
  belongs_to :song
  belongs_to :genre
end