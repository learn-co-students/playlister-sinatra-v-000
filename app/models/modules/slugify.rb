module Slugify
	module ClassMethods
		def find_by_slug(slug)
			@slug = slug.split("-").map { |n| n.capitalize }.join(" ")
			self.find_by(name: @slug)
		end
	end

	module InstanceMethods
		def slug
				self.name.gsub(" ", "-").downcase
	  	end

	end
end