module Slugifiable
	extend ActiveSupport::Concern
	
	def slug
		self.name.downcase.split(" ").join("-")
	end
	
	module ClassMethods
		def find_by_slug(slug)
			name = slug.split("-").map {|w| w.capitalize}.join(" ")
			self.all.find_by(name: name)
		end
	end
	
end