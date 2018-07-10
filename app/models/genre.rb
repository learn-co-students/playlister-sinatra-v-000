class Genre < ActiveRecord::Base
    has_many_artists
    has_many_songs
end