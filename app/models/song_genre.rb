class SongGenre < ActiveRecord::Base
	require_relative './concerns/slugifiable.rb'

	extend Slugifiable::ClassMethods
	include Slugifiable::InstanceMethods
	
	belongs_to :song
	belongs_to :genre

	#validates :song_id, :genre_id, presence: true
end
