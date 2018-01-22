class SongGenre < ActiveRecord::Base
  belongs_to :Artist
  belongs_to :Song
end
