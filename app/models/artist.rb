class Artist < ActiveRecord::Base

	extend Slugify::Slugfinder
	include Slugify::Slugger

	has_many :songs
	has_many :genres, through: :songs
end