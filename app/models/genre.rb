# genre.rb object model
require_relative './concerns/slug'

class Genre < ActiveRecord::Base
	has_many :songs, through: :song_genres
	has_many :song_genres
	has_many :artists, through: :songs

	extend Slug::ClassMethods		

	include Slug::InstanceMethods
end
