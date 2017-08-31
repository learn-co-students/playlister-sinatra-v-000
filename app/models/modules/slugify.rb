module Slugify
	module ClassMethods
		def find_by_slug(slug)
			# @slug = slug.split("-").map { |n| n.capitalize }.join(" ")
			# self.find_by(name: @slug)
			self.all.find { |name| name.slug == slug}
		end
	end

	module InstanceMethods
		def slug
				self.name.downcase.gsub(" ", "-")
	  	end

	end
end