class SongGenre < ActiveRecord::Base
  belongs_to :song
  belongs_to :genre

  extend Slugified::ClassMethods
  include Slugified::InstanceMethods
end
