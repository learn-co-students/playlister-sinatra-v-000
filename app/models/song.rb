class Song < ActiveRecord::Base
	include Slugfindable::InstanceMethods
	extend Slugfindable::ClassMethods	
	belongs_to :artist
	has_many :song_genres
	has_many :genres, :through => :song_genres
end 