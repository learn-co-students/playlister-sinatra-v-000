class Song < ActiveRecord::Base
	belongs_to :artist
	has_many :song_genres
	has_many :genres, through: :song_genres

	def slug
		if name.present?
			name.downcase.gsub(" ", "-") 
		end
	end

	def self.find_by_slug(slug)
		Song.all.each do |a|
			if a.slug == slug
				return a
			end
		end
	end

end