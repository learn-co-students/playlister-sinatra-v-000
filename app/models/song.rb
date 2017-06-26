class Song < ActiveRecord::Base

	belongs_to :artist
	belongs_to :genre
	has_many :song_genres
	has_many :genres, through: :song_genres

	def slug
		binding.pry
		@slug = self.name.downcase
   	@slug = @slug.gsub(/(^\s+|[^a-zA-Z0-9 ]+|\s+$)/,"") # remove all punctuations
   	@slug = @slug.gsub(/\s+/, "-")  # replace all spaces with dashes
   	@slug
	end

	def self.find_by_slug(slug)
		Song.find_by(url_slug: slug)
	end

end
