class Song < ActiveRecord::Base
	has_many :song_genres
	has_many :genres, :through => :song_genres
	belongs_to :artist

	def slug
		self.name.gsub(/\ /, "-").downcase
	end

	def self.find_by_slug(slug)
		self.all.map {|info| @name = info.name if info.slug == slug}
		self.find_by(:name => @name)
	end
end