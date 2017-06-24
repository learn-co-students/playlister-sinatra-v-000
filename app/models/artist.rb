class Artist < ActiveRecord::Base
	has_many :songs
	has_many :genres, through: :songs

	def slug
		@slug = self.name
		@slug = @slug.gsub(/(^\s+|[^a-zA-Z0-9 ]+|\s+$)/,"") # remove all punctuations
		@slug = @slug.gsub(/\s+/, "-") # replace all spaces with dashes
		@slug
	end

	def self.find_by_slug(slug)
		unslug_name = slug.gsub(/-/, ' ') # replace all dashes with spaces
		Artist.find_by_name(unslug_name)
	end

end
