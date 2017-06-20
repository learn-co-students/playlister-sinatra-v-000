class Song < ActiveRecord::Base
	belongs_to :artist
	belongs_to :genre
	has_many :song_genres
	has_many :genres, through: :song_genres

	def slug
			@slug = self.name
	   	@slug = @slug.gsub(/[^a-zA-Z0-9 ]+/,"")  # remove all punctuations
	   	@slug = @slug.gsub(/\s+/, "-")  # replace all spaces with dashes
	   	@slug
	end

	def self.find_by_slug(slug)
		unslug_name = slug.gsub(/-/, ' ') # replace all dashes with spaces
		Song.find_by_name(unslug_name)
	end

end
