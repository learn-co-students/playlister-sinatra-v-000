require_relative 'concerns/slugifiable'

class SongGenre < ActiveRecord::Base
  include Slugifiable::InstanceMethods
  extend Slugifiable::ClassMethods
  belongs_to :song
  belongs_to :genre
end
