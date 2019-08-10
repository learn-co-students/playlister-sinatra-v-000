module Slugifiable # This helps with creating readable URLs
  module ClassMethods
    def find_by_slug(slug)
      # Find the object of this class whose name can be changed into the given slug.
      # Use the #slug instance method.
      
      self.all.detect {|obj| obj.slug == slug}
    end
  end 
  
  module InstanceMethods
    def slug
      # Lowercase the object's name
      # Then replace groups of one or more of any character except a letter, number, underscore, or + sign, with a hyphen -
      # Some of the slugs are still pretty long, but most are not.
      # Later on, I'll change things like I'm and you're to im and youre, instead of i-m and you-re
      
      name.downcase.split(/[^\w\+]+/).join("-")
    end
  end
end