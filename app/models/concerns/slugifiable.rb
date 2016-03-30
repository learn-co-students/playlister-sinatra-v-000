module Slugifiable
	extend ActiveSupport::Concern
	
	def slug
		self.name.downcase.split(" ").join("-")
	end
	
	module ClassMethods
		def find_by_slug(slug)
			self.all.find { |instance| instance.slug == slug}
		end
	end
	
end