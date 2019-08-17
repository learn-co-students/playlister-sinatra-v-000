module Slugifiable
    module InstanceMethods 
        def slug 
            @slug = self.name.downcase.split(" ").join("-")
        end
    end

    module ClassMethods
        def find_by_slug(slug)
            results = self.all.find {|result|result.slug == slug}
        end
    end
end