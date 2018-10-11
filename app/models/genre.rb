require_relative '../models/concerns/slugifiable'

class Genre < ActiveRecord::Base
    has_many :song_genres
    has_many :songs, through: :song_genres
    has_many :artists, through: :songs

    include Slugifiable
    extend Slugifiable::ClassMethods
end
