class SongGenre < ActiveRecord::Base
  include Slugifiable
  
  belongs_to :song 
  belongs_to :genre 
end