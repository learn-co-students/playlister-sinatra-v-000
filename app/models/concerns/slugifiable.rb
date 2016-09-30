module Slugifiable
  module ClassMethods
    def find_by_slug(slug)
      self.all.find{|s| s.slug == slug}
    end
  end

  module InstanceMethods
    def slug
      name.downcase.gsub(" ","-")
    end
  end
end
# slugifiable.rb

# This is where modules go

# A quick note on the placement of Modules. 
# Put all Modules in a concerns folder and to be namespaced like this module Concerns::ModuleName.


# Put this in the class you want to use the module in 
# extend Concerns::ModuleName