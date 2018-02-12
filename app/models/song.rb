class Song < ActiveRecord::Base

	include Slugifiable::Instances
 	extend Slugifiable::Classes

	belongs_to :artist
	has_many :song_genres
	has_many :genres, through: :song_genres

end