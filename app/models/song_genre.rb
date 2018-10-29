class SongGenre < ActiveRecord::Base
  #name
  belongs_to :song
  belongs_to :genre
end
