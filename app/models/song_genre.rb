class SongGenre < ActiveRecord::Base
  include Slugifiable
  extend Findable
  
  belongs_to :song
  belongs_to :genre
end