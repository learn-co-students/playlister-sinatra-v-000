class Artist < ActiveRecord::Base
    

    has_many :song_genres
    has_many :genres, through: :songs
end
