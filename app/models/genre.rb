class Genre < ActiveRecord::Base
  has_many :artists, through: :songs
  has_many :songs, through: :song_genres
  has_many :song_genres

  
	def slug
		slug = self.name.gsub(" ","-").downcase
	end
	

	def self.find_by_slug(slug)
		self.all.find {|t| t.slug == slug}
	end

  
end