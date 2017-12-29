class SongGenre < ActiveRecord::Base
  belongs_to :genres
  belongs_to :song
end
