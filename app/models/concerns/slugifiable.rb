module Slugifiable
	module InstanceMethods
		def slug
			#self.name.gsub(" ","-").downcase
			self.name.downcase.split(" ").map {|word| word.gsub(/\W/,'')}.join("-")
			#removes extraneous punctuation(ex. "." or "'") that cannot be added back in with the find_by_slug method
		end
	end

	module ClassMethods
		def find_by_slug(slug_name)
			self.all.find{|instance| instance.slug == slug_name}
			#self.all.find_by(slug_name) why doesn't this work?
	    end
	end
end
