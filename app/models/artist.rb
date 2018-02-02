class Artist < ActiveRecord::Base
		has_many :genres, through: :songs
		has_many :songs


	def slug
		self.name.downcase.gsub(" ","-")
	end

	
	def self.find_by_slug(slug)
		name = slug.gsub("-", " ")	
		Artist.all.find {|artist| artist.name.downcase == name}
	end


end 
