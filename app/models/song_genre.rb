class SongGenre < ActiveRecord::Base
    belongs_to_song
    belongs_to_genre
end