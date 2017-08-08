class Genre < ActiveRecord::Base
	has_many :song_genres
	has_many :songs, through: :song_genres
	has_many :artists, through: :songs

	def slug
		a = []
		a = self.name.split(" ")
		self.slug_string = a.join("-").downcase
		self.save
		self.slug_string
	end

	def self.find_by_slug(slug)
		Genre.find_by(slug_string: slug)
	end
end