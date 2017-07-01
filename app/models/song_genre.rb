class SongGenre < ActiveRecord::Base
  include Slugifable

  belongs_to :song
  belongs_to :genre
end
