class SongGenre < ActiveRecord::Base
  has_many :artists
  has_many :songs
end
