require_relative 'concerns/slugifiable'

class Artist < ActiveRecord::Base
    extend Slugifiable::ClassMethods
    include Slugifiable::InstanceMethods
    has_many :genres, through: :songs
    has_many :songs

    
end