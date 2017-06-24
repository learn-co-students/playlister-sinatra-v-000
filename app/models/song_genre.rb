class SongGenre < ActiveRecord::Base
	include Slugifidable::InstanceMethods
	extend Slugifidable::ClassMethods
	belongs_to :genre
	belongs_to :song
end 