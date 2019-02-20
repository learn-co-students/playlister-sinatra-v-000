class Genre < ActiveRecord::Base
	has_many :song_genres
	has_many :songs, through: :song_genres
	has_many :artists, through: :songs

	def slug
		if name.present? 
			name.downcase.gsub(" ", "-") 
		end
	end

	def self.find_by_slug(slug)
		Genre.all.each do |a|
			if a.slug == slug
				return a
			end
		end
	end
end