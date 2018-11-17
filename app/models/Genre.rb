class Genre < ActiveRecord::Base
	has_many :song_genres
	has_many :songs, through: :song_genres
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
		return Genre.find_by(name: y)
	end
end