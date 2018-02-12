class Artist < ActiveRecord::Base

	include Slugifiable::Instances
 	extend Slugifiable::Classes

	has_many :songs
	has_many :genres, through: :songs

end