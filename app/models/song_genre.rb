class SongGenre < ActiveRecord::Base
  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods
  belongs_to :song
  belongs_to :genre
end
