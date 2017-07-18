class SongGenreRelationship < ActiveRecord::Base
  belongs_to :song
  belongs_to :genre
end