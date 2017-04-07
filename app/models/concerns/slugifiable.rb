module Slugifiable
	module InstanceMethods
		def slug
			name.downcase.gsub(/\s+/, '-')
		end
	end

	module ClassMethods
		def find_by_slug(name)
			self.all.detect {|object|
				object.slug == name}
		end
	end
end