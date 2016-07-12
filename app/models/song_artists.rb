class SongArtist < ActiveRecord::Base
  belongs_to :song
  belongs_to :artist
  include Slugifiable::InstanceMethods
    extend Slugifiable::ClassMethods
end
