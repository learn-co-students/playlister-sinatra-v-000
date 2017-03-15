module Slugifiable
    module InstanceMethods
        def slug
            s = self.name.downcase.split.join("-") 
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