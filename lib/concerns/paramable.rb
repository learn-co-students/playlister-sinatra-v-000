module Paramable   
    module ClassMethods
        def find_by_slug(slug)
            self.all.detect do |a|
                a.slug == slug
            end
        end    
    end
    module InstanceMethods
        def slug 
            self.name.downcase.gsub(" ", "-")
        end
    end
end
