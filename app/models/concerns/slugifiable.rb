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
      # Lowercase the object's name, and replace blank spaces with -
      name.downcase.split.join("-")
    end
  end
end