class Song < ActiveRecord::Base
	belongs_to :artist
	has_many :song_genres
	has_many :genres, through: :song_genres

	def slug
		self.name.downcase.gsub(" ", "-")
	end
	
	def self.find_by_slug(slug)
		name = slug.gsub("-", " ")
		id = nil
		Song.all.each do |song|
			if song.name.downcase == name
				return Song.find(song.id)
			end
		end
		
	end
end