module Slugifiable
    module ClassMethods
        def find_by_slug(slug)
            self.all.find {|model| model.slug == slug }
        end
    end

    module InstanceMethods
        def slug
            self.name.split(" ").collect {|name| name.downcase}.join("-")
        end
    end
end