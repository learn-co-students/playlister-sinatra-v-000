class Genre < ActiveRecord::Base
	has_many :song_genres
	has_many :songs, through: :song_genres
	has_many :artists, through: :songs
	extend Slugable::ClassMethods
	include Slugable::InstanceMethods
end