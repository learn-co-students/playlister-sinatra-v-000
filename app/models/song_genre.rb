require_relative '../models/concerns/slugable.rb'

class SongGenre < ActiveRecord::Base 
    belongs_to :song
    belongs_to :genre
end