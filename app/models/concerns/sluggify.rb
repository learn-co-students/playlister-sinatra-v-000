module Sluggify
    module InstanceMethods
        def slug
            name.parameterize
        end
    end

    module ClassMethods
        def self.find_by_slug(slug)
            self.all.find {|s| s.name.parameterize == slug}
        end
    end
end