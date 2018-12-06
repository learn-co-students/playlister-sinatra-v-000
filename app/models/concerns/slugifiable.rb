module Slugifiable
  module InstanceMethods
      def slug
         slug = self.name.downcase.gsub(" ","-")
      end
    end

     module ClassMethods
       def find_by_slug(slug)
         self.all.find { |song| song.name.downcase == slug.split("-").join(" ").downcase }
       end
    end
end
