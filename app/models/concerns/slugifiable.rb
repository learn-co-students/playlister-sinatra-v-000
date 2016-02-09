module Slugifiable
  
  module InstanceMethods
    def slug
      name_to_slug = []
      legal_chars = ('a'..'z').to_a + ('A'..'Z').to_a + ("1".."9").to_a + ["+"]
      self.name.split(" ").each do |word|
        name_to_slug << word.downcase.split("").delete_if{|char| !legal_chars.include?(char)}.join
      end
      name_to_slug.join("-")
    end
  end

  module ClassMethods
    def self.find_by_slug(slug)
      found = nil
      self.all.each do |element|
        if element.slug == slug
          found = element
        end
      end
      found
    end
  end

end