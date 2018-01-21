class Artist < ActiveRecord::Base
		has_many :genres, through: :songs
		has_many :songs


	def slug
		self.name.downcase.gsub(" ","-")
	end

	
	def self.find_by_slug(slug)
		name = slug.split("-").collect {
		|name| name.capitalize}.join(" ")
		
		Artist.find_by_name(name)	
	end


end 
