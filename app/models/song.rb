class Song < ActiveRecord::Base
    belongs_to_artist
    has_multiple_genres
end