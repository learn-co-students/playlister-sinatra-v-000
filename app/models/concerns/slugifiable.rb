module Slugifiable
	module InstanceMethods
		def slug
    		slug = name.gsub(" ","-").downcase
  		end
  	end

  	module ClassMethods
  		def self.find_by_slug(slug)
    		self.all.find {|t| t.slug == slug}
  		end
  	end
end