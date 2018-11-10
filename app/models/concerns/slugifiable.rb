module Slugifiable
  module InstanceMethods
      def slug
         slug = self.name.downcase.gsub(" ","-")
      end
    end
    
     module ClassMethods
      def find_by_slug(slug)
        self.all.find { |thing| thing.slug == slug }
      end
    end
    
end
