

#lets create a module taht can be used to slug our urls

module Slugable
  module InstanceMethods
      def slug
    #    binding.pry
    # casn be performed on the instance itself's name
    #takes spaces and -, replaces it and capitalizes
    #gsub sets up the regex and the replacement
          self.name.to_s.downcase.gsub(' ', "-").gsub(/[^\w-]/, '')
      end
  end
  module  ClassMethods
    #can operate on the class itself,
    #uses an enumerable detect on an array using an argument slug, to ensure it matches the instances slug
      def find_by_slug(slug)
          self.all.detect{|item| item.slug==slug}
      end
  end

end
