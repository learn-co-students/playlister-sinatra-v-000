class Artist < ActiveRecord::Base
	has_many :songs
	has_many :genres, through: :songs

	def slug
		a = []
		a = self.name.split(" ")
		self.slug_string = a.join("-").downcase
		self.save
		self.slug_string
	end

	def self.find_by_slug(slug)
		Artist.find_by(slug_string: slug)
	end
end