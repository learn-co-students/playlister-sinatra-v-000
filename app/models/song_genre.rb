class SongGenre < ActiveRecord::Base
  belongs_to :song
  belongs_to :genre

  
	def slug
		slug = self.name.gsub(" ","-").downcase
	end
	

	def self.find_by_slug(slug)
		self.all.find {|t| t.slug == slug}
	end

  
end