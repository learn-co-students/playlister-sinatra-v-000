# join table between song & genre:
# a song can have multiple genres, and a genre can have multiple songs

class SongGenre < ActiveRecord::Base
  belongs_to :song
  belongs_to :genre

  extend Slugify::ClassMethods
  include Slugify::InstanceMethods
end
