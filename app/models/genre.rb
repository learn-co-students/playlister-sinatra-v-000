class Genre < ActiveRecord::Base
	has_many :artists, through: :songs
	has_many :song_genres
	has_many :songs, through: :song_genres

	def slug
	   	@slug = self.name.downcase
	   	@slug = @slug.gsub(/(^\s+|[^a-zA-Z0-9 ]+|\s+$)/,"") # remove all punctuations
	   	@slug = @slug.gsub(/\s+/, "-")  # replace all spaces with dashes
	   	@slug
	end

	def self.find_by_slug(slug)
		Genre.find_by(url_slug: slug)
	end
end
