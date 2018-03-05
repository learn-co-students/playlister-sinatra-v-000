class Artist < ActiveRecord::Base
	has_many :songs
	has_many :genres, through: :songs

	def slug
		self.name.split(" ").join("-")
	end

	def self.find_by_slug(slug)
		name = slug.split("-").join(" ")
		Artist.find_by(name: name)
	end
end