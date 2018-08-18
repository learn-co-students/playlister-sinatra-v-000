require_relative '../models/concerns/slugifiable'

class SongGenre < ActiveRecord::Base
  belongs_to :song
  belongs_to :genre
end