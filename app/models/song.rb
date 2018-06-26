class Song < ActiveRecord::Base
  belongs_to :artist
  has_many :song_genres
  has_many :genres, through: :song_genres

 
	def slug
		slug = self.name.gsub(" ","-").downcase
	end
	

	def self.find_by_slug(slug)
		self.all.find {|t| t.slug == slug}
	end


end