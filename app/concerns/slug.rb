module Slug
    module InstanceMethods
        def slug
            lowercase = self.name.downcase
            arr = lowercase.split
            stripped = arr.collect { |x| x.match(/[a-z]*/) }
            stripped.join("-")
        end
    end
    
    module ClassMethods
        def find_by_slug(slug)
            arr = slug.split("-")
            slug_name = arr.join(" ")
            self.where(name == slug_name).last
        end
    end
end