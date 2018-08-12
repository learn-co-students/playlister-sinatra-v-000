class SongGenre < ActiveRecord::Base

  has_many :song
  has_many :genres
end
