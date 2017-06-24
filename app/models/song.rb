class Song < ActiveRecord::Base
	include Slugifidable::InstanceMethods
	extend Slugifidable::ClassMethods	
	belongs_to :artist
	has_many :song_genres
	has_many :genres, :through => :song_genres
end 