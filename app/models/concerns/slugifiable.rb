module Slugifiable

	module InstanceMethods
		def slug
			title_array = self.name.split.map do |word|
				word.downcase
			end
			
			title_array.join("-")
		end
	end

	module ClassMethods
		def find_by_slug(slug)
			normal_name = slug.gsub(/-/, " ")
			searchable_name = normal_name.split.map do |word| 
				unless (word == "the" || word == "with" || word == "a" || word == "to")
					word.capitalize
				else
					word
				end
			end
			real_name = searchable_name.join(" ")
			# binding.pry
			find_by(name: real_name)
		end
	end

end