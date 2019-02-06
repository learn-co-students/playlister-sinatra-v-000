class SongGenre < ActiveRecord::Base
  belongs_to :genres
  belongs_to :artist
end