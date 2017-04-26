module Slugifiable
	module InstanceMethods
		def slug
			self.name.downcase.split.join('-')
		end
	end

	module ClassMethods
		def find_by_slug(slug)
			# binding.pry
			self.all.detect{|x| slug == x.slug}
		end
	end
end