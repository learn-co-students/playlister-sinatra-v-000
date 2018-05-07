class SongGenre < ActiveRecord::Base
  include Slugifiable
  extend Slugifiable
belongs_to :genre
belongs_to :song
end
