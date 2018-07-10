class Artist < ActiveRecord::Base
    has_many_songs
    has_many_genres
end