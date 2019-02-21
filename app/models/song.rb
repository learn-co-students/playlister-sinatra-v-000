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
		Song.all.find{ |song| song.slug == slug }
	end

end