class Genre < ActiveRecord::Base
	has_many :song_genres
	has_many :songs, :through => :song_genres
	has_many :artists, :through => :songs
	

	def slug(str= "#{self.name}") 
		str.gsub(' ', '-').downcase
	end

	def self.find_by_slug(slug)
		name = slug.gsub('-', ' ').split(' ').map{|word| word.capitalize}.join(' ')
		
		Genre.all.find{|song| song.slug == slug}

	end




end