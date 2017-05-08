module Slugifiable
  
  LOWERCASE_WORDS = ["a", "an", "the", "at", "by", "for", "in", "of", 
"on", "to", "up", "and", "as", "but", "or", "nor", "with"]


  module InstanceMethods
    def slug
      self.name.gsub(" ", "-").downcase
    end
  end
  
  module ClassMethods    
    def find_by_slug(slug)
      name = slug.gsub("-", " ")
      formatted_name = name.split.map do |word|
        if !LOWERCASE_WORDS.include?(word)
          word.capitalize 
        else
          word 
        end
      end.join(" ")
      self.find_by(name: formatted_name)
    end
  end
end

