require 'pry'
module Slugifiable
    module InstanceMethods
        def slug
            begin
            s = self.name.downcase.split.join("-") 
            rescue
                s= ''
            end
            s
        end
    end

    module ClassMethods
        def find_by_slug(a_slug)
            match = self.all.select do |instance|
                
                    
                instance.slug == a_slug 
            end
            match[0]
        end
    end
end