module Slugifiable

	module InstanceMethods
		def slug
			name_array = name.downcase.split
			name_slug = name_array.join("-")
		end
	end

	module ClassMethods
		def find_by_slug(slug)
			self.all.find do |x|
				x.slug == slug
			end
		end
	end
end
