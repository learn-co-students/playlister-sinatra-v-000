require_relative 'concerns/slugifiable'

class Genre < ActiveRecord::Base
    extend Slugifiable::ClassMethods
    include Slugifiable::InstanceMethods
    has_many :song_genres
    has_many :songs, through: :song_genres
    has_many :artists, through: :songs
    #note: check that even though this isn't a join table
    #that has_many through is the correct way to portray this
end