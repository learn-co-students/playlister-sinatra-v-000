class Artist < ActiveRecord::Base
	has_many :songs
	has_many :genres, through: :songs
	has_many :artists, through: :songs

	def slug
		return name.downcase.split(" ").join("-")
	end

	def self.find_by_slug(slug)
		x = slug.split("-")
		y = []
		x.each do |word|
			if (word != "the") && (word != "with") && (word != "a")
				y << word.titleize
			else
				y << word
			end
		end
		y = y.join(" ")
		return Artist.find_by(name: y)
	end
end