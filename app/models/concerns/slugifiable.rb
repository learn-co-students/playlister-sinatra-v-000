
module Slugifiable
	module InstanceMethods

		def slug
			self.name.downcase.gsub(' ', '-')
	# text take out space, put in dash 
		end 
	end 
	module ClassMethods

		def self.find_by_slug(slug)
			self.all.find {|thing| thing.slug == slug}
			
		end
	end 

end 

#because you don't store the slugs, loop through everything, 
#slugigy it, then see if it matches your slug. Wow. 

