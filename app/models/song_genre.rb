class SongGenre < ActiveRecord::Base
  include Slugified::InstanceMethods
  extend Slugified::ClassMethods
belongs_to :genre
belongs_to :song
end
