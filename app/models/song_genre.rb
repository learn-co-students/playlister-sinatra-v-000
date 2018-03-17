class SongGenre < ActiveRecord::Base
  has_many :Songs
  has_many :Genres
end
