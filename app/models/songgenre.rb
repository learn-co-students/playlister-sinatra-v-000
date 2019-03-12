class SongGenre < ActiveRecord::Base #join table class
  has_many :songs
  has_many :genres
end
