class Song < ActiveRecord::Base
	belongs_to :artist
	has_many :song_genres
	has_many :genres, through: :song_genres

	def slug
		slug_name = self.name.downcase.split
		@slug = slug_name.join('-')
	end

	def self.find_by_slug(slug)
		Song.all.each do |a|
			if a.slug == slug
				return a
			end
		end
	end

end