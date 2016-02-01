module Concerns
	module Concerns::Slugifiable
		def self.included(base)
    	base.extend(ClassMethods)
  	end

  	module ClassMethods
  		def find_by_slug(slug)
				name = slug.split("-").map { |word| word.strip.capitalize }
				self.find_by(name: name.join(" "))
			end
		end

		
		def slug
			slug = self.name.split(" ").map { |word| word.strip.downcase } 
			slug.join("-")
		end	
	end
end


