module Concerns
	module Concerns::Slugifiable
		def self.included(base)
    	base.extend(ClassMethods)
  	end

  	module ClassMethods
  		def find_by_slug(slug)
  			self.all.detect { |object| object.slug == slug }
			end
		end

		
		def slug
			slug = self.name.split(" ").map { |word| word.strip.downcase } 
			slug.join("-")
		end	
	end
end


