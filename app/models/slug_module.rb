module Slug

		module InstanceMethods
		def slug
			self.name.downcase.strip.gsub(' ', '-')
		end 
	end 

	module ClassMethods
			
		def find_by_slug(slug)
			self.all.detect do |item|
				item.slug == slug		
			end	
		end
	end 
end 