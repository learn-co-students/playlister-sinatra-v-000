require_relative '../models/concerns/slugable.rb'

class Song < ActiveRecord::Base 
    belongs_to :artist
    has_many :song_genres
    has_many :genres, through: :song_genres
    extend Slugable::ClassMethods
    include Slugable::InstanceMethods
end
  