class Song < ActiveRecord::Base
    has_many :song_genres
    belongs_to :artist
    has_many :genres, through: :song_genres
    include Slugger
    extend Slugger
end
