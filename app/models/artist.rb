require_relative 'concerns/slugifiable.rb'

class Artist < ActiveRecord::Base
    include Slugifiable

    has_many :songs
    has_many :genres, through: :songs
end