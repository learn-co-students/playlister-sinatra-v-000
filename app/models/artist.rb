class Artist < ActiveRecord::Base
	has_many :songs
	has_many :genres, :through => :songs

	def slug
		self.name.gsub(/\ /, "-").downcase
	end

	def self.find_by_slug(slug)
		self.all.map {|info| @name = info.name if info.slug == slug}
		self.find_by(:name => @name)
	end
end