class Song < ActiveRecord::Base
	belongs_to :artist
	has_many :song_genres
	has_many :genres, through: :song_genres

	def slug
		return name.downcase.split(" ").join("-")
	end

	def self.find_by_slug(slug)
		x = slug.titleize.split("-").join(" ")
		return Song.find_by(name: x)
	end
end