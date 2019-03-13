class SongGenre < ActiveRecord::Base #join table class
  belongs_to :song
  belongs_to :genre
end
