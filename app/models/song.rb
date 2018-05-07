class Song < ActiveRecord::Base
	belongs_to :artist
	has_many :song_genres
	has_many :genres, :through => :song_genres

	def slug(str= "#{self.name}") 
		str.gsub(' ', '-').downcase
	end

	def self.find_by_slug(slug)
		name = slug.gsub('-', ' ').split(' ').map{|word| word.capitalize}.join(' ')

	
	   Song.all.find{|song| song.slug == slug}
	

	end



end