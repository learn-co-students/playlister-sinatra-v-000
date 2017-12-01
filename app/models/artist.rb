class Artist < ActiveRecord::Base
	
	include Slugifiable::InstanceMethods
	extend Slugifiable::ClassMethods
	
	has_many :songs
	has_many :genres, :through => :songs

	def self.find_by_slug(slug)
    	Artist.all.find{|artist| artist.slug == slug}
  	end
end 
