module Slugifiable
	module InstanceMethods
		def slug
			string = self.name.gsub /\s*\+\s*/, " plus "
			#binding.pry
			words = self.name.split(" ")
			no_special = words.map do |word|
				word.gsub! /\s*@\s*/, "at"
				word.gsub! /\s*&\s*/, "and"
				word.split(/[,'"\.?!()]/).join("").downcase
			end
			no_special.join("-")
		end
	end

	module ClassMethods
		def find_by_slug(slug)
			self.all.find do |a|
				a.slug == slug
			end
		end
	end
end