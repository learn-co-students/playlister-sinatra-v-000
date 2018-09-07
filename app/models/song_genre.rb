class SongGenre < ActiveRecord::Base
  include Slugifiable::InstanceMethods
  belongs_to :song
  belongs_to :genre
end