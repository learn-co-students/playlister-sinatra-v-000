class SongGenre < ActiveRecord::Base
	
	include Slugifiable::InstanceMethods
	extend Slugifiable::ClassMethods
	
	belongs_to :genre
	belongs_to :song

	def self.find_by_slug(slug)
    	Artist.all.find{|artist| artist.slug == slug}
  	end
end 