class Genre < ActiveRecord::Base
	has_many :song_genres
	has_many :songs, through: :song_genres
	has_many :artists, through: :songs

	def slug
		slug_name = self.name.downcase.split
		@slug = slug_name.join('-')
	end

	def self.find_by_slug(slug)
		example = Genre.all.each do |a|
			if a.slug == slug
				return a
			end
		end
	end
end