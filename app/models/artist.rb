class Artist < ActiveRecord::Base
	has_many :songs
	has_many :genres, through: :songs

	def slug
		if name.present? 
			name.downcase.gsub(" ", "-") 
		end
	end

	def self.find_by_slug(slug)
		Artist.all.each do |a|
			if a.slug == slug
				return a
			end
		end
	end

end