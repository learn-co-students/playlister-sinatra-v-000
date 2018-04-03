class SongGenre < ActiveRecord::Base
  has_many :songs
end
