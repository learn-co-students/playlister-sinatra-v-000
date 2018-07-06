class Artist < ActiveRecord::Base
	has_many :genres, through: :songs
	has_many :songs
	
	def slug
		slug = self.name.gsub(" ","-").downcase
	end
	

	def self.find_by_slug(slug)
		self.all.find {|t| t.slug == slug}
	end

end