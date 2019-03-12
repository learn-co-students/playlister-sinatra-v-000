class Artist < ActiveRecord::Base
    has_many :songs
    has_many :artist_genres
    has_many :genres, through: :songs

    extend Slugifiable
    include Slugifiable::InstanceMethods
end