class SongGenre < ActiveRecord::Base
  belongs_to :genre
  belongs_to :song
end
#song having many genres and genre having many songs
