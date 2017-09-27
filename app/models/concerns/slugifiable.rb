module Slugifiable

	module InstanceMethods
		def slug
			input = self.name.downcase.split.collect{|string|string.scan(/[a-z0-9]/)}
			input.collect {|arr|arr.join("")}.join('-')
		end
	end

	module ClassMethods

		def find_by_slug(slug)
			collection = self.all
			collection.find {|instance| instance.slug == slug}
		end

	end

end