class SongGenre < ActiveRecord::Base
  has_many :genres
  has_many :song, through: :genres
end
