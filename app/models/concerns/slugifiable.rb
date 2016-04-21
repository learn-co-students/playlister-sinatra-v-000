module Slugifiable
	module InstanceMethods

		def slug
			self.name.gsub(" ", "-").downcase
		end

		
	end
end