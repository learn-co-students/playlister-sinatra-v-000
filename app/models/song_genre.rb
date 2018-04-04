class SongGenre < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
end
