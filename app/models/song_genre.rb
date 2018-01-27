class SongGenre < ActiveRecord::Base
  belongs_to :genre_id
  belongs_to :song
end
