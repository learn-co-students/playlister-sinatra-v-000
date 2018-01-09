class SongGenre < ActiveRecord::Base
        belongs_to :song
        belongs_to :genre
end


#this is our join table that sets the connection between 2 classes which also have their own connections,
#by connecting this join table we have the ability to connect our other relationships ex artist has many genres through songs
