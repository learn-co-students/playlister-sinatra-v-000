module Slugifiable
	module Instances

	def slug 
			word = self.name.downcase
			word_array = word.split(" ")
			word_array.join("-")
		end
	end

	module Classes

		def find_by_slug(slug)
			self.all.detect {|instance| instance.slug == slug }
		end

	end
	
end
