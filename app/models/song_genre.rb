class SongGenre < ActiveRecord::Base
	include Slugfindable::InstanceMethods
	extend Slugfindable::ClassMethods
	belongs_to :genre
	belongs_to :song
end 