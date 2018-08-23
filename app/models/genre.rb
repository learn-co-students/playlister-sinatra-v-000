class Genre < ActiveRecord::Base
	require_relative './concerns/slugifiable.rb'

	extend Slugifiable::ClassMethods
	include Slugifiable::InstanceMethods

	has_many :song_genres
	has_many :songs, through: :song_genres
	has_many :artists, through: :songs
end
