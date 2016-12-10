class Song < ActiveRecord::Base
	extend Slugify::Slugfinder
	include Slugify::Slugger

	belongs_to :artist
	has_many :song_genres
	has_many :genres, through: :song_genres
end