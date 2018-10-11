require_relative '../models/concerns/slugifiable'

class Artist < ActiveRecord::Base
    has_many :songs
    has_many :genres, through: :songs

    include Slugifiable
    extend Slugifiable::ClassMethods
end
