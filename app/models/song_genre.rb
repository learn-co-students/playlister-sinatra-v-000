class SongGenre < ActiveRecord::Base
  belongs_to :songs
  belongs_to :genre
end
