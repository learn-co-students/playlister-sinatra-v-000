class SongGenre <ActiveRecord::Base
  belongs_to :genre
  belongs_to :songs
end
