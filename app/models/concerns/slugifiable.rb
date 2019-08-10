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
      # Then replace groups of one or more blank spaces and/or special characters with a hyphen -
      # Some of the slugs are still pretty long, but most are not.
      
      name.downcase.split(/\W+/).join("-")
    end
  end
end