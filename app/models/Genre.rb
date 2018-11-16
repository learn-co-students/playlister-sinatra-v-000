class Genre < ActiveRecord::Base
	has_many :song_genres
	has_many :songs, through: :song_genres
	has_many :artists, through: :songs

	def slug
		return name.downcase.split(" ").join("-")
	end

	def self.find_by_slug(slug)
		x = slug.split("-").join(" ").titleize
		return Genre.find_by(name: x)
	end
end