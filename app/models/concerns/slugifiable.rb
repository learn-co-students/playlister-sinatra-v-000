module Slugifiable
   module InstanceMethods
       def slug
           name = self.name.downcase.strip.gsub(' ', '-')
           name
       end
   end
   
   module ClassMethods
       def find_by_slug(name)
          self.all.find do |s|
              s.slug == name
          end
       end
   end
    
    
end