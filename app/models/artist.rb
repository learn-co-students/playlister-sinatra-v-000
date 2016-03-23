class Artist < ActiveRecord::Base
	has_many :songs
	has_many :genres, through: :songs

	def slug
		self.name.gsub(" ","-").downcase
	end

	def self.find_by_slug(slug)
		@name = slug.split("-")
		@name.map do |i| 
			if i != "a" && i != "with" && i != 'the' && i != 'and' && i != 'an'
				i.capitalize! 
			end
		end
		@name = @name.join(" ")
		self.find_by(name: @name)
	end
end