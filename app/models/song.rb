class Song < ActiveRecord::Base
    belongs_to :Artist
    has_many :SongGenres
    has_many :genres, through::SongGenres
end
