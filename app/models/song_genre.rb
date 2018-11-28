class SongGenre < ActiveRecord::Base
  has_many :song_id
  has_many :genre_id
end
