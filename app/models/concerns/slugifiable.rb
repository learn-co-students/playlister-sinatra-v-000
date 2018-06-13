module Slugifiable

	module Klass 

		def find_by_slug(slug)
			all.find {|instance| instance.slug == slug}
		end

	end


	module Instance

		def slug
			self.name.downcase.gsub(/[" "]/, '-')
		end

	end
	

end
