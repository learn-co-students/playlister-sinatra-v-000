class Artist < ActiveRecord::Base 
	has_many :songs
	has_many :genres, :through => :songs

	def slug(str= "#{self.name}") 
		str.gsub(' ', '-').downcase
	end

	def self.find_by_slug(slug)
		name = slug.gsub('-', ' ').split(' ').map{|word| word.capitalize}.join(' ')
		
		Artist.all.find{|song| song.slug == slug}

	end


end