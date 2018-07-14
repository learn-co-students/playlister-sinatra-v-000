module Slugify

  module InstanceMethods
    def slug
      self.name.downcase.strip.gsub!(' ','-') #Converts name to slug
    end
  end

  module ClassMethods
    def find_by_slug(slug)
      #returned_name_from_slug = slug.gsub!('-', ' ').split(/\W+/).each {|w| w.capitalize!}.join(" ") #Replaces dash with space and capitalize first letter in each word
      #self.find_by name: returned_name_from_slug #Returns Object with specific name

      #Code above will not work because each word in saved "name" may not begin with a capitalized letter

      returned_object_from_slug = Object.new

      self.all.each do |s|
        if s.slug == slug
          returned_object_from_slug = s
        end
      end

      returned_object_from_slug
    end
  end

end
