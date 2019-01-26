# song.rb object model
require_relative './concerns/slug'

class Song < ActiveRecord::Base
	has_many :genres, through: :song_genres
	belongs_to :artist
	has_many :song_genres

	extend Slug::ClassMethods

	include Slug::InstanceMethods
end