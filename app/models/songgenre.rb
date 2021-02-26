class SongGenre < ActiveRecord::Base
    belongs_to :song
    belongs_to :genre
    #since this is a belongs_to it's singular! doi
    
end