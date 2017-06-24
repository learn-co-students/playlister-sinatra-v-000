class Genre < ActiveRecord::Base
	include Slugifidable::InstanceMethods
	extend Slugifidable::ClassMethods
	has_many :song_genres
	has_many :songs, :through => :song_genres
	has_many :artists, :through => :songs
end 