module Slugify

	module Slugger
		def slug
		  self.name.strip.downcase.gsub(/(&|&amp;)/, ' and ').gsub(/[\s\.\/\\]/, '-').gsub(/[^\w-]/, '').gsub(/[-_]{2,}/, '-').gsub(/^[-_]/, '').gsub(/[-_]$/, '')			
		end
	end

	module Slugfinder
		def find_by_slug(input_slug)
			self.all.find {|instance| instance.slug == input_slug}
		end
	end
end