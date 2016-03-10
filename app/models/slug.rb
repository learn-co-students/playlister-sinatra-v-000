module Slug
  module InstanceMethods
    def slug
      self.name.downcase.gsub(" ", "-")
    end
  end
  module ClassMethods
    def find_by_slug(slug)
      exceptions = ["a", "with", "the", "and", "to"]
      i = 0
      name = slug.split("-").map do |word| 
        i += 1 
        unless exceptions.include?(word) && i != 1 
          word.capitalize 
        else
          word
        end
      end.join(" ")
      self.find_by(name: name)
    end
  end
end