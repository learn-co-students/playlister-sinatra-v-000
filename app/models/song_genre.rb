class SongGenre < ActiveRecord::Base

	include Slugifiable::Instances
 	extend Slugifiable::Classes

	belongs_to :genre
	belongs_to :song

end