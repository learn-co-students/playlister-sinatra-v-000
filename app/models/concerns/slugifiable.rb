module Slugifiable
    module ClassMethods
        def find_by_slug(name)
            self.all.detect {|t| t.slug == name}
        end
    end

    module InstanceMethods
        def slug
            self.name.split(" ").join("-").downcase
        end
    end
end