class SongGenre < ActiveRecord::Base
  # extend Concerns::Slugifiable
  belongs_to :song
  belongs_to :genre
end