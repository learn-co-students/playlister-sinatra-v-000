class Genre < ActiveRecord::Base
	has_many :song_genres
	has_many :songs, through: :song_genres
	has_many :artists, through: :songs

	def slug 
		self.name.split(/\W+/).join('-').downcase
	end

	def self.find_by_slug(slug)
		self.all.detect{|ob| ob.slug == slug}
	end
end