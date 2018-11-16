class Artist < ActiveRecord::Base
	has_many :songs
	has_many :genres, through: :songs
	has_many :artists, through: :songs

	def slug
		return name.downcase.split(" ").join("-")
	end

	def self.find_by_slug(slug)
		x = slug.split("-").join(" ").titleize
		return Artist.find_by(name: x)
	end
end