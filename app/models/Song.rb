class Song < ActiveRecord::Base
	belongs_to :artist
	has_many :song_genres
	has_many :genres, through: :song_genres

	def slug
		return name.downcase.split(" ").join("-")
	end

	def self.find_by_slug(slug)
		x = slug.split("-")
		y = []
		x.each do |word|
			if (word != "the") && (word != "with")
				y << word.titleize
			else
				y << word
			end
		end
		y = y.join(" ")
		return Song.find_by(name: y)
	end
end